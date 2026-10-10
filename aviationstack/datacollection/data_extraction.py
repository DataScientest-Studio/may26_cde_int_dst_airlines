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

def collect_flights(flights_collection, pg_conn):
    """
    Extract flights from the flights collection and store them in PostgreSQL.
    """
    print("Extracting flights from MongoDB...")
    flights = flights_collection.find({}, {"_id": 0})  # Exclude the MongoDB _id field
    flight_data_list = []
    
    for flight in flights:
        flight_data = map_flight_data(flight)
        flight_data_list.append(flight_data)

    print(f"Found {len(flight_data_list)} flights. Inserting into PostgreSQL...")

    commit_counter = 0
    for flight_data in flight_data_list:
        with pg_conn.cursor() as cursor:
            cursor.execute(
                """
                INSERT INTO public.data_flight (
                    flight_date, flight_status
                ) VALUES (
                    %s, %s
                )
                RETURNING id;
                """,
                (
                    flight_data["data_flight"]["flight_date"],
                    flight_data["data_flight"]["flight_status"]
                )
            )
            flight_id = cursor.fetchone()[0]
            
            cursor.execute(
                """
                INSERT INTO public.data_departure 
                    (flight_id, airport, timezone, iata, icao, terminal, gate, delay, scheduled, estimated, actual, estimated_runway, actual_runway, baggage)
                VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s);
                """,
                (flight_id,
                    flight_data["data_departure"]["airport"],
                    flight_data["data_departure"]["timezone"],
                    flight_data["data_departure"]["iata"],
                    flight_data["data_departure"]["icao"],
                    flight_data["data_departure"]["terminal"],
                    flight_data["data_departure"]["gate"],
                    flight_data["data_departure"]["delay"],
                    flight_data["data_departure"]["scheduled"],
                    flight_data["data_departure"]["estimated"],
                    flight_data["data_departure"]["actual"],
                    flight_data["data_departure"]["estimated_runway"],
                    flight_data["data_departure"]["actual_runway"],
                    flight_data["data_departure"]["baggage"]
                )
            )
                
            cursor.execute(
                """
                INSERT INTO public.data_arrival
                    (flight_id, airport, timezone, iata, icao, terminal, gate, delay, scheduled, estimated, actual, estimated_runway, actual_runway, baggage)
                VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s);
                """,
                (flight_id,
                    flight_data["data_arrival"]["airport"],
                    flight_data["data_arrival"]["timezone"],
                    flight_data["data_arrival"]["iata"],
                    flight_data["data_arrival"]["icao"],
                    flight_data["data_arrival"]["terminal"],
                    flight_data["data_arrival"]["gate"],
                    flight_data["data_arrival"]["delay"],
                    flight_data["data_arrival"]["scheduled"],
                    flight_data["data_arrival"]["estimated"],
                    flight_data["data_arrival"]["actual"],
                    flight_data["data_arrival"]["estimated_runway"],
                    flight_data["data_arrival"]["actual_runway"],
                    flight_data["data_arrival"]["baggage"]
                )
            )                
            
            cursor.execute(
                """
                INSERT INTO public.data_airline
                    (flight_id, name, iata, icao)
                VALUES (%s,%s,%s,%s);
                """,
                (flight_id,
                    flight_data["data_airline"]["name"],
                    flight_data["data_airline"]["iata"],
                    flight_data["data_airline"]["icao"]
                )
            )
            
            cursor.execute(
                """
                INSERT INTO public.data_flight2
                    (flight_id, number, iata, icao, is_codeshared)
                VALUES (%s,%s,%s,%s,%s);
                """,
                (flight_id,
                    flight_data["data_flight2"]["number"],
                    flight_data["data_flight2"]["iata"],
                    flight_data["data_flight2"]["icao"],
                    flight_data["data_flight2"]["codeshared"]
                )
            )
            
            if flight_data.get("data_flight2").get("codeshared"):
                cursor.execute(
                    """
                    INSERT INTO public.data_flight2_codeshared
                        (flight_id, airline_name, airline_iata, airline_icao, flight_number, flight_iata, flight_icao)
                    VALUES (%s,%s,%s,%s,%s,%s,%s);
                    """,
                    (flight_id,
                        flight_data["data_flight2_codeshared"]["airline_name"],
                        flight_data["data_flight2_codeshared"]["airline_iata"],
                        flight_data["data_flight2_codeshared"]["airline_icao"],
                        flight_data["data_flight2_codeshared"]["flight_number"],
                        flight_data["data_flight2_codeshared"]["flight_iata"],
                        flight_data["data_flight2_codeshared"]["flight_icao"]
                    )
                )
            
            
            

            
            pg_conn.commit()
            commit_counter += 1
    print("{} Flights inserted into PostgreSQL.".format(commit_counter))

def map_flight_data(source_flight):
    """
    Map the source flight data from MongoDB to the PostgreSQL schema.
    """
    result = {"data_flight":{
            "flight_date": source_flight.get("flight_date"),
            "flight_status": source_flight.get("flight_status")
        },
        "data_departure": {
            "airport": source_flight.get("departure", {}).get("airport"),
            "timezone": source_flight.get("departure", {}).get("timezone"),
            "iata": source_flight.get("departure", {}).get("iata"),
            "icao": source_flight.get("departure", {}).get("icao"),
            "terminal": source_flight.get("departure", {}).get("terminal"),
            "gate": source_flight.get("departure", {}).get("gate"),
            "delay": source_flight.get("departure", {}).get("delay"),
            "scheduled": source_flight.get("departure", {}).get("scheduled"),
            "estimated": source_flight.get("departure", {}).get("estimated"),
            "actual": source_flight.get("departure", {}).get("actual"),
            "estimated_runway": source_flight.get("departure", {}).get("estimated_runway"),
            "actual_runway": source_flight.get("departure", {}).get("actual_runway"),
            "baggage": source_flight.get("departure", {}).get("baggage"),
            },
        "data_arrival": {
            "airport": source_flight.get("arrival", {}).get("airport"),
            "timezone": source_flight.get("arrival", {}).get("timezone"),
            "iata": source_flight.get("arrival", {}).get("iata"),
            "icao": source_flight.get("arrival", {}).get("icao"),
            "terminal": source_flight.get("arrival", {}).get("terminal"),
            "gate": source_flight.get("arrival", {}).get("gate"),
            "delay": source_flight.get("arrival", {}).get("delay"),
            "scheduled": source_flight.get("arrival", {}).get("scheduled"),
            "estimated": source_flight.get("arrival", {}).get("estimated"),
            "actual": source_flight.get("arrival", {}).get("actual"),
            "estimated_runway": source_flight.get("arrival", {}).get("estimated_runway"),
            "actual_runway": source_flight.get("arrival", {}).get("actual_runway"),
            "baggage": source_flight.get("arrival", {}).get("baggage"),
            },
        "data_airline": {
            "name": source_flight.get("airline", {}).get("name"),
            "iata": source_flight.get("airline", {}).get("iata"),
            "icao": source_flight.get("airline", {}).get("icao"),
        },
        "data_flight2": {
            "number": source_flight.get("flight", {}).get("number"),
            "iata": source_flight.get("flight", {}).get("iata"),
            "icao": source_flight.get("flight", {}).get("icao"),
            "codeshared": source_flight.get("flight", {}).get("codeshared") is not None,
        },
    }
    
    if source_flight.get("flight", {}).get("codeshared"):
        result["data_flight2_codeshared"] = {
            "airline_name": source_flight.get("flight", {}).get("codeshared", {}).get("airline_name"),
            "airline_iata": source_flight.get("flight", {}).get("codeshared", {}).get("airline_iata"),
            "airline_icao": source_flight.get("flight", {}).get("codeshared", {}).get("airline_icao"),
            "flight_number": source_flight.get("flight", {}).get("codeshared", {}).get("flight_number"),
            "flight_iata": source_flight.get("flight", {}).get("codeshared", {}).get("flight_iata"),
            "flight_icao": source_flight.get("flight", {}).get("codeshared", {}).get("flight_icao")
        }
   
    return result

mng_client, flights_collection = connect_to_mongodb()
pg_conn = connect_to_postgresql()

collect_airports(flights_collection, pg_conn)
collect_airlines(flights_collection, pg_conn)
collect_flights(flights_collection, pg_conn)

