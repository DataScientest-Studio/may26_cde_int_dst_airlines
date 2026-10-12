"""Database Seeding Script.

Populates the SQL database with normalized reference data:
- Countries from api_exploration/bruno/Aviationstack/Countries
- Cities from api_exploration/bruno/Aviationstack/Cities
- Scraped IATA airport codes + enriched coordinates/timezones from Bruno Airports
- Real-world Airlines reference data from api_exploration/bruno/Aviationstack/Airlines
- Aircraft Types & Models from api_exploration/bruno/Aviationstack/Aircraft Types
- Fleet Airplanes from api_exploration/bruno/Aviationstack/Airplanes
"""

from __future__ import annotations

import csv
import json
import logging
import re
import sqlite3
from pathlib import Path
from typing import Any, Dict, Optional

logging.basicConfig(level=logging.INFO, format="%(asctime)s [%(levelname)s] %(message)s")
logger = logging.getLogger(__name__)

ROOT_DIR = Path(__file__).resolve().parents[2]
SEEDS_DIR = ROOT_DIR / "database" / "seeds"
DDL_FILE = ROOT_DIR / "database" / "ddl" / "01_init_airline_schema.sql"
DEFAULT_DB_FILE = ROOT_DIR / "data" / "aviation.db"
BRUNO_DIR = ROOT_DIR / "api_exploration" / "bruno" / "Aviationstack"


def extract_bruno_json(filepath: Path) -> Optional[Dict[str, Any]]:
    """Extracts the JSON payload from a Bruno request YAML file."""
    if not filepath.exists():
        return None
    with open(filepath, "r", encoding="utf-8") as f:
        text = f.read()

    idx = text.find("data: |-")
    if idx == -1:
        return None
    start = text.find("{", idx)
    if start == -1:
        return None

    depth = 0
    in_string = False
    escape = False
    for i in range(start, len(text)):
        c = text[i]
        if escape:
            escape = False
            continue
        if c == "\\":
            escape = True
            continue
        if c == '"':
            in_string = not in_string
            continue
        if not in_string:
            if c == "{":
                depth += 1
            elif c == "}":
                depth -= 1
                if depth == 0:
                    try:
                        return json.loads(text[start : i + 1])
                    except Exception as e:
                        logger.warning(f"Failed to parse JSON from {filepath}: {e}")
                        return None
    return None


def seed_database(db_path: Path = DEFAULT_DB_FILE) -> None:
    """Creates tables if missing and seeds reference data from Bruno AviationStack collections."""
    db_path.parent.mkdir(parents=True, exist_ok=True)
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()

    # 1. Initialize schema
    logger.info(f"Applying DDL schema to {db_path}...")
    with open(DDL_FILE, "r", encoding="utf-8") as f:
        ddl_sql = f.read()
    # Normalize Postgres IDENTITY clause for SQLite execution
    sqlite_ddl = re.sub(
        r"(?:BIGINT|INT)\s+GENERATED\s+BY\s+DEFAULT\s+AS\s+IDENTITY\s+PRIMARY\s+KEY",
        "INTEGER PRIMARY KEY",
        ddl_sql,
        flags=re.IGNORECASE,
    )
    cursor.executescript(sqlite_ddl)
    cursor.execute("PRAGMA table_info(bookings)")
    booking_cols = [row[1] for row in cursor.fetchall()]
    if "document_id" not in booking_cols:
        cursor.execute("ALTER TABLE bookings ADD COLUMN document_id BIGINT REFERENCES passenger_documents(document_id) ON DELETE SET NULL")

    # 2. Seed Countries from Bruno Collection
    bruno_countries_file = BRUNO_DIR / "Countries" / "countries.yml"
    countries_data = extract_bruno_json(bruno_countries_file)
    if countries_data and "data" in countries_data:
        logger.info("Seeding countries from Bruno Countries collection...")
        country_rows = []
        for c in countries_data["data"]:
            iso2 = c.get("country_iso2")
            name = c.get("country_name")
            if not iso2 or not name:
                continue
            pop = int(c["population"]) if c.get("population") and str(c["population"]).isdigit() else None
            country_rows.append(
                (
                    iso2,
                    name,
                    c.get("country_iso3"),
                    c.get("continent"),
                    c.get("currency_code"),
                    c.get("capital"),
                    pop,
                )
            )
        cursor.executemany(
            """
            INSERT OR IGNORE INTO countries (
                country_iso2, country_name, country_iso3, continent, currency_code, capital, population
            ) VALUES (?, ?, ?, ?, ?, ?, ?)
            """,
            country_rows,
        )
        logger.info(f"Seeded {len(country_rows)} countries from Bruno collection.")

    # 3. Seed Cities from Bruno Collection
    bruno_cities_file = BRUNO_DIR / "Cities" / "cities.yml"
    cities_data = extract_bruno_json(bruno_cities_file)
    if cities_data and "data" in cities_data:
        logger.info("Seeding cities from Bruno Cities collection...")
        city_rows = []
        for ci in cities_data["data"]:
            name = ci.get("city_name")
            if not name:
                continue
            c_iso2 = ci.get("country_iso2")
            if c_iso2:
                cursor.execute("INSERT OR IGNORE INTO countries (country_iso2, country_name) VALUES (?, ?)", (c_iso2, c_iso2))
            city_rows.append(
                (
                    int(ci["city_id"]),
                    name,
                    ci.get("iata_code"),
                    c_iso2,
                    float(ci["latitude"]) if ci.get("latitude") else None,
                    float(ci["longitude"]) if ci.get("longitude") else None,
                    ci.get("timezone"),
                )
            )
        cursor.executemany(
            """
            INSERT OR IGNORE INTO cities (
                city_id, city_name, city_iata_code, country_iso2, latitude, longitude, timezone
            ) VALUES (?, ?, ?, ?, ?, ?, ?)
            """,
            city_rows,
        )
        logger.info(f"Seeded {len(city_rows)} cities from Bruno collection.")

    # Build city lookup map: city_iata_code -> city_id
    cursor.execute("SELECT city_iata_code, city_id FROM cities WHERE city_iata_code IS NOT NULL")
    city_map = dict(cursor.fetchall())

    # 4. Seed Airports (Scraped CSV + Enriched from Bruno Airports)
    airports_csv = SEEDS_DIR / "iata_airports.csv"
    if airports_csv.exists():
        logger.info(f"Seeding airports from {airports_csv}...")
        with open(airports_csv, mode="r", encoding="utf-8") as f:
            reader = csv.DictReader(f)
            airport_rows = [
                (
                    row["iata_code"],
                    row.get("icao_code", ""),
                    row["airport_name"],
                    None,  # city_id
                    None,  # country_iso2
                    row.get("location", ""),
                    "",  # country
                    None,
                    None,
                    "",
                )
                for row in reader
            ]
            cursor.executemany(
                """
                INSERT OR IGNORE INTO airports (
                    iata_code, icao_code, name, city_id, country_iso2, city, country, latitude, longitude, timezone
                ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                """,
                airport_rows,
            )
        logger.info(f"Seeded {len(airport_rows)} airports from scraped dataset.")

    # Enrich / Supplement with Bruno Airports
    bruno_airports_file = BRUNO_DIR / "Airports" / "airports.yml"
    bruno_airports_data = extract_bruno_json(bruno_airports_file)
    if bruno_airports_data and "data" in bruno_airports_data:
        logger.info("Enriching airports from Bruno AviationStack collection...")
        enriched_count = 0
        for apt in bruno_airports_data["data"]:
            iata = apt.get("iata_code")
            if not iata:
                continue
            c_iso2 = apt.get("country_iso2")
            if c_iso2:
                cursor.execute("INSERT OR IGNORE INTO countries (country_iso2, country_name) VALUES (?, ?)", (c_iso2, apt.get("country_name") or c_iso2))

            city_iata = apt.get("city_iata_code")
            city_id = city_map.get(city_iata)

            cursor.execute(
                """
                INSERT INTO airports (iata_code, icao_code, name, city_id, country_iso2, city, country, latitude, longitude, timezone)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                ON CONFLICT(iata_code) DO UPDATE SET
                    icao_code = COALESCE(EXCLUDED.icao_code, airports.icao_code),
                    city_id = COALESCE(EXCLUDED.city_id, airports.city_id),
                    country_iso2 = COALESCE(EXCLUDED.country_iso2, airports.country_iso2),
                    city = COALESCE(EXCLUDED.city, airports.city),
                    country = COALESCE(EXCLUDED.country, airports.country),
                    latitude = COALESCE(EXCLUDED.latitude, airports.latitude),
                    longitude = COALESCE(EXCLUDED.longitude, airports.longitude),
                    timezone = COALESCE(EXCLUDED.timezone, airports.timezone)
                """,
                (
                    iata,
                    apt.get("icao_code"),
                    apt.get("airport_name") or iata,
                    city_id,
                    c_iso2,
                    apt.get("city_iata_code"),
                    apt.get("country_name"),
                    float(apt["latitude"]) if apt.get("latitude") else None,
                    float(apt["longitude"]) if apt.get("longitude") else None,
                    apt.get("timezone"),
                ),
            )
            enriched_count += 1
        logger.info(f"Enriched {enriched_count} airports with coordinates, timezones, and geographic keys.")

    # 5. Seed Airlines from Bruno Collection
    bruno_airlines_file = BRUNO_DIR / "Airlines" / "airlines.yml"
    airlines_data = extract_bruno_json(bruno_airlines_file)
    if airlines_data and "data" in airlines_data:
        logger.info("Seeding airlines from Bruno AviationStack collection...")
        airline_rows = []
        for a in airlines_data["data"]:
            iata = a.get("iata_code")
            if not iata:
                continue
            c_iso2 = a.get("country_iso2")
            if c_iso2:
                cursor.execute("INSERT OR IGNORE INTO countries (country_iso2, country_name) VALUES (?, ?)", (c_iso2, a.get("country_name") or c_iso2))
            airline_rows.append(
                (
                    int(a["airline_id"]),
                    iata,
                    a.get("icao_code"),
                    a.get("airline_name") or iata,
                    a.get("callsign"),
                    c_iso2,
                    a.get("country_name"),
                    a.get("status") == "active",
                )
            )
        cursor.executemany(
            """
            INSERT OR IGNORE INTO airlines (
                airline_id, iata_code, icao_code, name, callsign, country_iso2, country, is_active
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
            """,
            airline_rows,
        )
        logger.info(f"Seeded {len(airline_rows)} real airlines from Bruno collection.")

    # 6. Seed Airplane Models from Bruno Collection
    bruno_types_file = BRUNO_DIR / "Aircraft Types" / "aircraft types.yml"
    types_data = extract_bruno_json(bruno_types_file)
    if types_data and "data" in types_data:
        logger.info("Seeding airplane models from Bruno Aircraft Types collection...")
        model_rows = []
        for m in types_data["data"]:
            iata = m.get("iata_code")
            name = m.get("aircraft_name", "")
            if not iata or not name:
                continue
            mfr = name.split()[0] if name else "Commercial Aviation"
            model_rows.append(
                (
                    int(m["plane_type_id"]),
                    iata,
                    mfr,
                    180,
                    6000,
                    850,
                )
            )
        cursor.executemany(
            """
            INSERT OR IGNORE INTO airplane_models (
                model_id, model_code, manufacturer, seat_capacity, range_km, cruising_speed_kmh
            ) VALUES (?, ?, ?, ?, ?, ?)
            """,
            model_rows,
        )
        logger.info(f"Seeded {len(model_rows)} aircraft models from Bruno collection.")

    # 7. Seed Fleet Airplanes from Bruno Collection
    bruno_airplanes_file = BRUNO_DIR / "Airplanes" / "airplanes.yml"
    airplanes_data = extract_bruno_json(bruno_airplanes_file)
    if airplanes_data and "data" in airplanes_data:
        logger.info("Seeding airplanes from Bruno Airplanes collection...")
        # Ensure any referenced airlines in airplanes dataset exist in airlines table
        for p in airplanes_data["data"]:
            al_iata = p.get("airline_iata_code")
            if al_iata:
                cursor.execute(
                    "INSERT OR IGNORE INTO airlines (iata_code, name, is_active) VALUES (?, ?, ?)",
                    (al_iata, f"Airline {al_iata}", True),
                )

        cursor.execute("SELECT iata_code, airline_id FROM airlines")
        airline_map = dict(cursor.fetchall())

        cursor.execute("SELECT model_code, model_id FROM airplane_models")
        model_map = dict(cursor.fetchall())

        plane_rows = []
        for p in airplanes_data["data"]:
            tail = p.get("registration_number")
            al_iata = p.get("airline_iata_code")
            if not tail or not al_iata or al_iata not in airline_map:
                continue

            airline_id = airline_map[al_iata]
            model_id = model_map.get(p.get("iata_code_short"))

            m_year = None
            first_flight = p.get("first_flight_date") or p.get("delivery_date")
            if first_flight and len(first_flight) >= 4 and first_flight[:4].isdigit():
                m_year = int(first_flight[:4])

            plane_rows.append(
                (
                    int(p["airplane_id"]),
                    tail,
                    airline_id,
                    model_id,
                    m_year,
                    p.get("plane_status") or "active",
                )
            )

        cursor.executemany(
            """
            INSERT OR IGNORE INTO airplanes (
                airplane_id, tail_number, airline_id, model_id, manufacture_year, status
            ) VALUES (?, ?, ?, ?, ?, ?)
            """,
            plane_rows,
        )
        logger.info(f"Seeded {len(plane_rows)} fleet airplanes from Bruno collection.")

    conn.commit()
    conn.close()
    logger.info(f"Seeding completed successfully into {db_path}!")


if __name__ == "__main__":
    seed_database()
