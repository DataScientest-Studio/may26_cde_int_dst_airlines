from __future__ import print_function
import os
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint
import psycopg
import pandas as pd
from datetime import datetime
from dotenv import load_dotenv
import codecs
import encodings

def connect_to_postgresql():
    """
    Connect to PostgreSQL using environment variables.
    Returns Psycopg2 connection object.
    """
    print(f"Connecting to PostgreSQL at {PGSQL_HOST}:{PGSQL_PORT}/{PGSQL_DATABASE}...")
    conn = psycopg.connect(
        host=PGSQL_HOST,
        port=PGSQL_PORT,
        dbname=PGSQL_DATABASE,
        user=PGSQL_USERNAME,
        password=PGSQL_PASSWORD
    )
    return conn

# Load environment variables from .env file
load_dotenv()

# PostgreSQL connection
PGSQL_HOST = os.getenv("PGSQL_HOST", "localhost")
PGSQL_PORT = int(os.getenv("PGSQL_PORT", 5432))
PGSQL_DATABASE = os.getenv("PGSQL_DATABASE", "aviationstack")
PGSQL_USERNAME = os.getenv("PGSQL_USERNAME")
PGSQL_PASSWORD = os.getenv("PGSQL_PASSWORD")

# AviationStack API Configuration - from environment variables
AVIATIONSTACK_API_KEY = os.getenv("AVIATIONSTACK_API_KEY")

# Validate required environment variables
required_vars = {
    "PGSQL_HOST": PGSQL_HOST,
    "PGSQL_PORT": PGSQL_PORT,
    "PGSQL_DATABASE": PGSQL_DATABASE,
    "PGSQL_USERNAME": PGSQL_USERNAME,
    "PGSQL_PASSWORD": PGSQL_PASSWORD,   
    "AVIATIONSTACK_API_KEY": AVIATIONSTACK_API_KEY,
}

missing_vars = [var for var, val in required_vars.items() if not val]
if missing_vars:
    raise ValueError(f"Missing required environment variables: {', '.join(missing_vars)}")

print("Collecting airport data from AviationStack API...")

encodings.aliases.aliases['utf_8'] = 'utf_8'
codecs.register_error('strict', codecs.replace_errors)

pg_conn = connect_to_postgresql()

print(f"Using database: {PGSQL_DATABASE}")

# Configure API key authorization: ApiKeyAuth
configuration = swagger_client.Configuration()
configuration.api_key['access_key'] = AVIATIONSTACK_API_KEY
configuration.host = "https://api.aviationstack.com"

# create an instance of the API class
api_instance = swagger_client.APIEndpointsApi(swagger_client.ApiClient(configuration))

# API call parameters - customize these as needed
access_key = AVIATIONSTACK_API_KEY
limit = 100  # Number of records to retrieve per API call (max 100)
offset = 0 # Offset for pagination - adjust as needed for multiple pages of results
flight_status = None #str | Filter your results by flight status. Available values: scheduled, active, landed, cancelled, incident, diverted (optional)
#flight_date = datetime.now().strftime('%Y-%m-%d') # Not supported by basic plan!

# Optional filter parameters - set to None to not filter by these
dep_iata = None
arr_iata = None
dep_icao = None
arr_icao = None
airline_name = None
airline_iata = None
airline_icao = None
flight_number = None
flight_iata = None
flight_icao = None

# Optional Delay filter parameters (in minutes)
min_delay_dep = None
min_delay_arr = None
max_delay_dep = None
max_delay_arr = None

# Optional Scheduled time filters
arr_scheduled_time_arr = None
dep_scheduled_time_dep = None


def get_airport_data(limit=100, offset=0, access_key=AVIATIONSTACK_API_KEY):
    """
    Fetch flight data from AviationStack API and store it in MongoDB.
    """

    try:
        print(f"Fetching flight data from AviationStack API...")
        print(f"Parameters: limit={limit}, offset={offset}")
        
        api_response = api_instance.get_airlines(
            access_key,
    #        param_callback=None,
            limit=limit,
            offset=offset,
    #        flight_status=flight_status,
    #        flight_date=flight_date,
    #        dep_iata=dep_iata,
    #        arr_iata=arr_iata,
    #        dep_icao=dep_icao,
    #        arr_icao=arr_icao,
    #        airline_name=airline_name,
    #        airline_iata=airline_iata,
    #        airline_icao=airline_icao,
    #        flight_number=flight_number,
    #        flight_iata=flight_iata,
    #        flight_icao=flight_icao,
    #        min_delay_dep=min_delay_dep,
    #        min_delay_arr=min_delay_arr,
    #        max_delay_dep=max_delay_dep,
    #        max_delay_arr=max_delay_arr,
    #        arr_scheduled_time_arr=arr_scheduled_time_arr,
    #        dep_scheduled_time_dep=dep_scheduled_time_dep
        )
        
        if api_response and hasattr(api_response, 'data'):
            airports = api_response.data
            print(f"Retrieved {len(airports)} flight records")

            # Convert each flight object to a dictionary
            airport_dicts = []
            for airport in airports:
                # Convert swagger model object to dict
                if hasattr(airport, 'to_dict'):
                    airport_data = airport.to_dict()
                else:
                    # Fallback: use __dict__ or vars()
                    airport_data = vars(airport) if hasattr(airport, '__dict__') else dict(airport)

                # Add metadata
                airport_data['_retrieved_at'] = datetime.utcnow()
                airport_data['_source'] = 'aviationstack'
                airport_dicts.append(airport_data)

                for airport_data in airport_dicts:
                    with pg_conn.cursor() as cursor:
                        cursor.execute(
                            "INSERT INTO public.airlines(id, fleet_average_age, airline_id, callsign, hub_code, iata_code, icao_code, country_iso2, date_founded, iata_prefix_accounting, airline_name, country_name, fleet_size, status, type)	VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s) ON CONFLICT (id) DO NOTHING;",
                            (airport_data["id"],  airport_data["fleet_average_age"], airport_data["airline_id"], airport_data["callsign"], airport_data["hub_code"], airport_data["iata_code"], airport_data["icao_code"], 
                             airport_data["country_iso2"], airport_data["date_founded"], airport_data["iata_prefix_accounting"], airport_data["airline_name"], airport_data["country_name"], airport_data["fleet_size"], 
                             airport_data["status"], airport_data["type"])
                        )
                        pg_conn.commit()
                print("Airports inserted into PostgreSQL.")
            else:
                print("No airport data received from API")
        else:
            print("Unexpected API response format")
            pprint(api_response)
        
        print("\nData collection complete!")
        
    except ApiException as e:
        print(f"Exception when calling APIEndpointsApi->get_airports: {e}")
    except Exception as e:
        print(f"Unexpected error: {e}")
#    finally:
#        client.close()
#        print("MongoDB connection closed")


def fill_postgre_with_airport_data():
    """
    Function to fill Postgre with airport data from AviationStack API.
    """
    for offset in range(13100, 26400, limit):  # Adjust the range as needed for more data
        print(f"\nFetching data with offset: {offset}")
        get_airport_data(limit=limit, offset=offset)

    print("Postgre connection closed")


fill_postgre_with_airport_data()