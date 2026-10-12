# Collection of flight data using Aviationstack API

# Requirements
- MongoDB Server
- PostgreSQL Server
- Python Runtime Environment
- Aviationstack Access Key

# Setup environment

## Setup MongoDB Server

Setup a MongoDB Server and create a collection that should be used for storing the raw data from the API (e.g. flights).

## Setup PostgreSQL Server

Setup a PostgreSQL server and create a database and scheme to be used for storing the flights data.
Schema and all tables are created using the schema creation files.

## Python Runtime Environment
The python environment can be set up creating a venv using the requirements.txt file:

`pip install -r requirements.txt` 

_HINT: There is a reference to the API client (swagger-client) in the requirements file which points to full file path - this need to be adapted accoding to the local file system!_

# Data retrieval using python script _collect_flightdata.py_

The script requires environment data for accessing the API, MongoDB and PostgreSQL.
These values can be provided using environment variables or creating an _.env_ file.
Copy the example file _.env.example_ as _.env_ and edit the values accordingly.

## Data Conversions / Cleansing

...

# Data extraction from MongoDB / Conversion to PostgreSQL Model

- codeshared: This is an optional data element contained in the JSON of data_flight2. Inorder to handle this in the database the folowing onversion is implemented:

In the database model in table data_flight2 the existince of a shared code is stored as boolean flag. The shared code itself is stored in its own table with the flight ID as key.