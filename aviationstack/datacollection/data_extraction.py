import os
import pprint as pp
from dotenv import load_dotenv
import pymongo as pm
import psycopg2
import pandas as pd


"""
This script is designed to extract data entities from flight data stored in 
a mongodb retrieved from the AviationStack API.
From the flight documents the following entities are extracted and stored in separate collections in postgrsql:
- Airlines
- Airports

It uses environment variables for configuration, including MongoDB connection details.

"""

# Load environment variables from .env file
load_dotenv()

# MongoDB Configuration - from environment variables
MONGO_HOST = os.getenv("MONGO_HOST", "127.0.0.1")
MONGO_PORT = int(os.getenv("MONGO_PORT", 27017))
MONGO_USERNAME = os.getenv("MONGO_USERNAME")
MONGO_PASSWORD = os.getenv("MONGO_PASSWORD")
MONGO_DB = os.getenv("MONGO_DB", "aviationstack")
MONGO_COLLECTION = os.getenv("MONGO_COLLECTION", "flights")

PGSQL_HOST = os.getenv("PGSQL_HOST", "localhost")
PGSQL_PORT = int(os.getenv("PGSQL_PORT", 5432))
PGSQL_DATABASE = os.getenv("PGSQL_DATABASE", "aviationstack")
PGSQL_USERNAME = os.getenv("PGSQL_USERNAME")
PGSQL_PASSWORD = os.getenv("PGSQL_PASSWORD")

# Validate required environment variables
required_vars = {
    "MONGO_USERNAME": MONGO_USERNAME,
    "MONGO_PASSWORD": MONGO_PASSWORD,
    "PGSQL_HOST": PGSQL_HOST,
    "PGSQL_PORT": PGSQL_PORT,
    "PGSQL_DATABASE": PGSQL_DATABASE,
    "PGSQL_USERNAME": PGSQL_USERNAME,
    "PGSQL_PASSWORD": PGSQL_PASSWORD,   
}

missing_vars = [var for var, val in required_vars.items() if not val]
if missing_vars:
    raise ValueError(f"Missing required environment variables: {', '.join(missing_vars)}")


def connect_to_mongodb():
    """
    Connect to MongoDB using environment variables.
    Returns the MongoDB client and the flights collection.
    """
    print(f"Connecting to MongoDB at {MONGO_HOST}:{MONGO_PORT}...")
    client = pm.MongoClient(
        host=MONGO_HOST,
        port=MONGO_PORT,
        username=MONGO_USERNAME,
        password=MONGO_PASSWORD
    )
    db = client[MONGO_DB]
    flights_collection = db[MONGO_COLLECTION]
    print(f"Using database: {MONGO_DB}, collection: {MONGO_COLLECTION}")
    return client, flights_collection

def connect_to_postgresql():
    """
    Connect to PostgreSQL using environment variables.
    Returns Psycopg2 connection object.
    """
    print(f"Connecting to PostgreSQL at {PGSQL_HOST}:{PGSQL_PORT}/{PGSQL_DATABASE}...")
    conn = psycopg2.connect(
        host=PGSQL_HOST,
        port=PGSQL_PORT,
        database=PGSQL_DATABASE,
        user=PGSQL_USERNAME,
        password=PGSQL_PASSWORD
    )
    return conn

def collect_airports(flights_collection, pg_conn):
    """
    Extract airports from the flights collection and store them in PostgreSQL.
    """
    print("Extracting airports from MongoDB...")
    #unique_airports = flights_collection.distinct("departure.airport") + flights_collection.distinct("arrival.airport")
    unique_airports = []
    flights= flights_collection.aggregate([
        {
            "$project": {
                "_id": 0,
                "departure": 1,
                "arrival": 1
            }
        }
    ])
    for flight in flights:
        departure_airport = map_airport_data(flight.get("departure", {}))
        arrival_airport = map_airport_data(flight.get("arrival", {}))
        if departure_airport and departure_airport not in unique_airports:
            unique_airports.append(departure_airport)
        if arrival_airport and arrival_airport not in unique_airports:
            unique_airports.append(arrival_airport)

    print(f"Found {len(unique_airports)} unique airports. Inserting into PostgreSQL...")

    for airport_data in unique_airports:
        with pg_conn.cursor() as cursor:
            cursor.execute(
                "INSERT INTO public.airport_data (id, airport_id, airport_name, iata_code, icao_code, timezone) VALUES (%s, %s, %s, %s, %s, %s) ON CONFLICT (iata_code) DO NOTHING;",
                (airport_data["id"], airport_data["airport_id"], airport_data["airport_name"], airport_data["iata_code"], airport_data["icao_code"], airport_data["timezone"])
            )
            pg_conn.commit()
    print("Airports inserted into PostgreSQL.")

def map_airport_data(source_airport):
    """
    Map the source airport data from MongoDB to the PostgreSQL schema.
    """
    return {
        "id": source_airport.get("airport"),
        "airport_id": source_airport.get("airport"),
        "airport_name": source_airport.get("airport"),
        "iata_code": source_airport.get("iata"),
        "icao_code": source_airport.get("icao"),
        "timezone": source_airport.get("timezone"),
    }

def collect_airlines(flights_collection, pg_conn):
    """
    Extract airlines from the flights collection and store them in PostgreSQL.
    """
    print("Extracting airlines from MongoDB...")
    unique_airlines = []
    flights= flights_collection.aggregate([
        {
            "$project": {
                "_id": 0,
                "airline": 1
            }
        }
    ])
    for flight in flights:
        airline_data = map_airline_data(flight.get("airline", {}))
        if airline_data and airline_data not in unique_airlines:
            unique_airlines.append(airline_data)

    df_airlines = pd.DataFrame(unique_airlines)
    nullvalues = df_airlines["iata_code"].isna()  # Check for missing values
    print(df_airlines.info())
    print(df_airlines[nullvalues])  # Print rows with missing values
    df_airlines = df_airlines.dropna(subset=["iata_code"])  # Drop rows with missing IATA codes
    unique_airlines = df_airlines.to_dict(orient='records')  # Convert back to list of dictionaries
    
    print(f"Found {len(unique_airlines)} unique airlines. Inserting into PostgreSQL...")

    for airline_data in unique_airlines:
        with pg_conn.cursor() as cursor:
            cursor.execute(
                "INSERT INTO public.airline_data (id, airline_id, airline_name, iata_code, icao_code) VALUES (%s, %s, %s, %s, %s) ON CONFLICT (iata_code) DO NOTHING;",
                (airline_data["id"], airline_data["airline_id"], airline_data["airline_name"], airline_data["iata_code"], airline_data["icao_code"])
            )
            pg_conn.commit()
    print("Airlines inserted into PostgreSQL.")

def map_airline_data(source_airline):
    """
    Map the source airline data from MongoDB to the PostgreSQL schema.
    """
    return {
        "id": source_airline.get("name"),
        "airline_id": source_airline.get("name"),
        "airline_name": source_airline.get("name"),
        "iata_code": source_airline.get("iata"),
        "icao_code": source_airline.get("icao"),
    }



mng_client, flights_collection = connect_to_mongodb()
pg_conn = connect_to_postgresql()

collect_airports(flights_collection, pg_conn)
collect_airlines(flights_collection, pg_conn)

