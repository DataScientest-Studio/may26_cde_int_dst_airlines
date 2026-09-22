from __future__ import print_function
import os
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint
import pymongo as pm
from datetime import datetime
from dotenv import load_dotenv


# Load environment variables from .env file
load_dotenv()

# MongoDB Configuration - from environment variables
MONGO_HOST = os.getenv("MONGO_HOST", "127.0.0.1")
MONGO_PORT = int(os.getenv("MONGO_PORT", 27017))
MONGO_USERNAME = os.getenv("MONGO_USERNAME")
MONGO_PASSWORD = os.getenv("MONGO_PASSWORD")
MONGO_DB = os.getenv("MONGO_DB", "aviationstack")
MONGO_COLLECTION = os.getenv("MONGO_COLLECTION", "flights")

# AviationStack API Configuration - from environment variables
AVIATIONSTACK_API_KEY = os.getenv("AVIATIONSTACK_API_KEY")

# Validate required environment variables
required_vars = {
    "MONGO_USERNAME": MONGO_USERNAME,
    "MONGO_PASSWORD": MONGO_PASSWORD,
    "AVIATIONSTACK_API_KEY": AVIATIONSTACK_API_KEY,
}

missing_vars = [var for var, val in required_vars.items() if not val]
if missing_vars:
    raise ValueError(f"Missing required environment variables: {', '.join(missing_vars)}")

print("Collecting flight data from AviationStack API...")

# Connect to MongoDB
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

# Configure API key authorization: ApiKeyAuth
configuration = swagger_client.Configuration()
configuration.api_key['access_key'] = AVIATIONSTACK_API_KEY

# create an instance of the API class
api_instance = swagger_client.APIEndpointsApi(swagger_client.ApiClient(configuration))

# API call parameters - customize these as needed
access_key = AVIATIONSTACK_API_KEY
limit = 100  # Number of records to retrieve per API call (max 100)
offset = 0 # Offset for pagination - adjust as needed for multiple pages of results
flight_status = None #str | Filter your results by flight status. Available values: scheduled, active, landed, cancelled, incident, diverted (optional)
flight_date = datetime.now().strftime('%Y-%m-%d') # Not supported by basic plan!

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

try:
    print(f"Fetching flight data from AviationStack API...")
    print(f"Parameters: limit={limit}, offset={offset}, flight_date={flight_date}")
    
    api_response = api_instance.get_flights(
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
        flights = api_response.data
        print(f"Retrieved {len(flights)} flight records")

        # Convert each flight object to a dictionary
        flight_dicts = []
        for flight in flights:
            # Convert swagger model object to dict
            if hasattr(flight, 'to_dict'):
                flight_data = flight.to_dict()
            else:
                # Fallback: use __dict__ or vars()
                flight_data = vars(flight) if hasattr(flight, '__dict__') else dict(flight)

            # Add metadata
            flight_data['_retrieved_at'] = datetime.utcnow()
            flight_data['_source'] = 'aviationstack'
            flight_dicts.append(flight_data)

        if flight_dicts:
            print(f"Inserting {len(flight_dicts)} records into MongoDB...")
            result = flights_collection.insert_many(flight_dicts)
            print(f"Successfully inserted {len(result.inserted_ids)} documents into MongoDB")
        else:
            print("No flight data received from API")
    else:
        print("Unexpected API response format")
        pprint(api_response)
    
    print("\nData collection complete!")
    
except ApiException as e:
    print(f"Exception when calling APIEndpointsApi->get_flights: {e}")
except pm.errors.ConnectionFailure as e:
    print(f"MongoDB connection error: {e}")
except pm.errors.PyMongoError as e:
    print(f"MongoDB operation error: {e}")
except Exception as e:
    print(f"Unexpected error: {e}")
finally:
    client.close()
    print("MongoDB connection closed")
