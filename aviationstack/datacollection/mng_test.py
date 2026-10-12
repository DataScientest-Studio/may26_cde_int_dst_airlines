import os
from pprint import pprint
import pymongo as pm
from dotenv import load_dotenv
from datetime import datetime

# Load environment variables from .env file
load_dotenv()

# MongoDB Configuration - from environment variables
MONGO_HOST = os.getenv("MONGO_HOST", "127.0.0.1")
MONGO_PORT = int(os.getenv("MONGO_PORT", 27017))
MONGO_USERNAME = os.getenv("MONGO_USERNAME")
MONGO_PASSWORD = os.getenv("MONGO_PASSWORD")
MONGO_DB = os.getenv("MONGO_DB", "aviationstack")
MONGO_COLLECTION = os.getenv("MONGO_COLLECTION", "flights")


# Validate required environment variables
required_vars = {
    "MONGO_USERNAME": MONGO_USERNAME,
    "MONGO_PASSWORD": MONGO_PASSWORD   
}

missing_vars = [var for var, val in required_vars.items() if not val]
if missing_vars:
    raise ValueError(f"Missing required environment variables: {', '.join(missing_vars)}")

pprint(required_vars)

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

testdoc = {"test": "connection", "timestamp": datetime.now().isoformat()}
print(testdoc)
flights_collection.insert_one(testdoc)  
