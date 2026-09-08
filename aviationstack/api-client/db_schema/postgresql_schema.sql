--
-- Schema objects for PostgreSQL
-- "AviationStack"
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--

--
-- DROP OBJECTS
-- (remove comment prefix to start using DROP commands)
--
-- TABLES
--
-- DROP TABLE IF EXISTS air_craft_type_data;
-- DROP TABLE IF EXISTS air_craft_types;
-- DROP TABLE IF EXISTS air_line_data;
-- DROP TABLE IF EXISTS air_lines;
-- DROP TABLE IF EXISTS air_plane_data;
-- DROP TABLE IF EXISTS air_planes;
-- DROP TABLE IF EXISTS airport_data;
-- DROP TABLE IF EXISTS airports;
-- DROP TABLE IF EXISTS api_error;
-- DROP TABLE IF EXISTS api_error_error;
-- DROP TABLE IF EXISTS cities;
-- DROP TABLE IF EXISTS city_data;
-- DROP TABLE IF EXISTS countries;
-- DROP TABLE IF EXISTS country_data;
-- DROP TABLE IF EXISTS data_aircraft;
-- DROP TABLE IF EXISTS data_airline;
-- DROP TABLE IF EXISTS data_departure;
-- DROP TABLE IF EXISTS data_flight;
-- DROP TABLE IF EXISTS data_flight2;
-- DROP TABLE IF EXISTS data_flight2_codeshared;
-- DROP TABLE IF EXISTS data_routes;
-- DROP TABLE IF EXISTS data_routes_flight;
-- DROP TABLE IF EXISTS datalive;
-- DROP TABLE IF EXISTS flights;
-- DROP TABLE IF EXISTS flights_future;
-- DROP TABLE IF EXISTS future_flight_aircraft;
-- DROP TABLE IF EXISTS future_flight_airline;
-- DROP TABLE IF EXISTS future_flight_data;
-- DROP TABLE IF EXISTS future_flight_data_codeshared;
-- DROP TABLE IF EXISTS future_flight_info;
-- DROP TABLE IF EXISTS future_flight_point;
-- DROP TABLE IF EXISTS pagination;
-- DROP TABLE IF EXISTS route_airline;
-- DROP TABLE IF EXISTS route_endpoint;
-- DROP TABLE IF EXISTS routes;
-- DROP TABLE IF EXISTS tax_data;
-- DROP TABLE IF EXISTS taxes;
-- DROP TABLE IF EXISTS timetable;
-- DROP TABLE IF EXISTS timetable_aircraft;
-- DROP TABLE IF EXISTS timetable_airline;
-- DROP TABLE IF EXISTS timetable_data;
-- DROP TABLE IF EXISTS timetable_data_codeshared;
-- DROP TABLE IF EXISTS timetable_flight;
-- DROP TABLE IF EXISTS timetable_schedule;

--
-- TYPES
--


--
-- CREATE OBJECTS
--
-- TYPES
--

--
-- TABLES
--
--
-- Table 'air_craft_type_data' generated from model 'AirCraftTypeData'
--
CREATE TABLE IF NOT EXISTS air_craft_type_data (
    "id" TEXT DEFAULT NULL,
    plane_type_id TEXT DEFAULT NULL,
    aircraft_name TEXT DEFAULT NULL,
    iata_code TEXT DEFAULT NULL
);
COMMENT ON TABLE air_craft_type_data IS 'Original model name - AirCraftTypeData.';

--
-- Table 'air_craft_types' generated from model 'AirCraftTypes'
--
CREATE TABLE IF NOT EXISTS air_craft_types (
    pagination TEXT DEFAULT NULL,
    "data" JSON DEFAULT NULL
);
COMMENT ON TABLE air_craft_types IS 'Original model name - AirCraftTypes.';

--
-- Table 'air_line_data' generated from model 'AirLineData'
--
CREATE TABLE IF NOT EXISTS air_line_data (
    "id" TEXT DEFAULT NULL,
    airline_id TEXT DEFAULT NULL,
    airline_name TEXT DEFAULT NULL,
    iata_code TEXT DEFAULT NULL,
    iata_prefix_accounting TEXT DEFAULT NULL,
    icao_code TEXT DEFAULT NULL,
    callsign TEXT DEFAULT NULL,
    "type" TEXT DEFAULT NULL,
    status TEXT DEFAULT NULL,
    fleet_size TEXT DEFAULT NULL,
    fleet_average_age TEXT DEFAULT NULL,
    date_founded TEXT DEFAULT NULL,
    hub_code TEXT DEFAULT NULL,
    country_name TEXT DEFAULT NULL,
    country_iso2 TEXT DEFAULT NULL
);
COMMENT ON TABLE air_line_data IS 'Original model name - AirLineData.';

--
-- Table 'air_lines' generated from model 'AirLines'
--
CREATE TABLE IF NOT EXISTS air_lines (
    pagination TEXT DEFAULT NULL,
    "data" JSON DEFAULT NULL
);
COMMENT ON TABLE air_lines IS 'Original model name - AirLines.';

--
-- Table 'air_plane_data' generated from model 'AirPlaneData'
--
CREATE TABLE IF NOT EXISTS air_plane_data (
    "id" TEXT DEFAULT NULL,
    airplane_id TEXT DEFAULT NULL,
    registration_number TEXT DEFAULT NULL,
    production_line TEXT DEFAULT NULL,
    iata_type TEXT DEFAULT NULL,
    model_name TEXT DEFAULT NULL,
    model_code TEXT DEFAULT NULL,
    icao_code_hex TEXT DEFAULT NULL,
    iata_code_short TEXT DEFAULT NULL,
    iata_code_long TEXT DEFAULT NULL,
    construction_number TEXT DEFAULT NULL,
    test_registration_number TEXT DEFAULT NULL,
    rollout_date TEXT DEFAULT NULL,
    first_flight_date TEXT DEFAULT NULL,
    delivery_date TEXT DEFAULT NULL,
    registration_date TEXT DEFAULT NULL,
    line_number TEXT DEFAULT NULL,
    plane_series TEXT DEFAULT NULL,
    airline_iata_code TEXT DEFAULT NULL,
    airline_icao_code TEXT DEFAULT NULL,
    plane_owner TEXT DEFAULT NULL,
    engines_count TEXT DEFAULT NULL,
    engines_type TEXT DEFAULT NULL,
    plane_age TEXT DEFAULT NULL,
    plane_status TEXT DEFAULT NULL,
    plane_class TEXT DEFAULT NULL
);
COMMENT ON TABLE air_plane_data IS 'Original model name - AirPlaneData.';

--
-- Table 'air_planes' generated from model 'AirPlanes'
--
CREATE TABLE IF NOT EXISTS air_planes (
    pagination TEXT DEFAULT NULL,
    "data" JSON DEFAULT NULL
);
COMMENT ON TABLE air_planes IS 'Original model name - AirPlanes.';

--
-- Table 'airport_data' generated from model 'AirportData'
--
CREATE TABLE IF NOT EXISTS airport_data (
    "id" TEXT DEFAULT NULL,
    airport_id TEXT DEFAULT NULL,
    airport_name TEXT DEFAULT NULL,
    iata_code TEXT DEFAULT NULL,
    icao_code TEXT DEFAULT NULL,
    latitude TEXT DEFAULT NULL,
    longitude TEXT DEFAULT NULL,
    geoname_id TEXT DEFAULT NULL,
    timezone TEXT DEFAULT NULL,
    gmt TEXT DEFAULT NULL,
    phone_number TEXT DEFAULT NULL,
    country_name TEXT DEFAULT NULL,
    country_iso2 TEXT DEFAULT NULL,
    city_iata_code TEXT DEFAULT NULL
);
COMMENT ON TABLE airport_data IS 'Original model name - AirportData.';

--
-- Table 'airports' generated from model 'Airports'
--
CREATE TABLE IF NOT EXISTS airports (
    pagination TEXT DEFAULT NULL,
    "data" JSON DEFAULT NULL
);
COMMENT ON TABLE airports IS 'Original model name - Airports.';

--
-- Table 'api_error' generated from model 'ApiError'
-- Standard apilayer error envelope, shared by every error response.
--
CREATE TABLE IF NOT EXISTS api_error (
    success BOOLEAN NOT NULL,
    "error" TEXT NOT NULL
);
COMMENT ON TABLE api_error IS 'Standard apilayer error envelope, shared by every error response.. Original model name - ApiError.';

--
-- Table 'api_error_error' generated from model 'ApiErrorUnderscoreerror'
--
CREATE TABLE IF NOT EXISTS api_error_error (
    code INTEGER NOT NULL,
    "type" TEXT NOT NULL,
    info TEXT DEFAULT NULL
);
COMMENT ON TABLE api_error_error IS 'Original model name - ApiError_error.';
COMMENT ON COLUMN api_error_error.code IS 'apilayer numeric error code (the code the API returns in the body, e.g. 101 for an invalid access key — NOT the HTTP status).';
COMMENT ON COLUMN api_error_error."type" IS 'Machine-readable error type.';
COMMENT ON COLUMN api_error_error.info IS 'Human-readable error detail.';

--
-- Table 'cities' generated from model 'Cities'
--
CREATE TABLE IF NOT EXISTS cities (
    pagination TEXT DEFAULT NULL,
    "data" JSON DEFAULT NULL
);
COMMENT ON TABLE cities IS 'Original model name - Cities.';

--
-- Table 'city_data' generated from model 'CityData'
--
CREATE TABLE IF NOT EXISTS city_data (
    "id" TEXT DEFAULT NULL,
    city_id TEXT DEFAULT NULL,
    city_name TEXT DEFAULT NULL,
    iata_code TEXT DEFAULT NULL,
    country_iso2 TEXT DEFAULT NULL,
    latitude TEXT DEFAULT NULL,
    longitude TEXT DEFAULT NULL,
    timezone TEXT DEFAULT NULL,
    gmt TEXT DEFAULT NULL,
    geoname_id TEXT DEFAULT NULL
);
COMMENT ON TABLE city_data IS 'Original model name - CityData.';

--
-- Table 'countries' generated from model 'Countries'
--
CREATE TABLE IF NOT EXISTS countries (
    pagination TEXT DEFAULT NULL,
    "data" JSON DEFAULT NULL
);
COMMENT ON TABLE countries IS 'Original model name - Countries.';

--
-- Table 'country_data' generated from model 'CountryData'
--
CREATE TABLE IF NOT EXISTS country_data (
    "id" TEXT DEFAULT NULL,
    country_id TEXT DEFAULT NULL,
    country_name TEXT DEFAULT NULL,
    country_iso2 TEXT DEFAULT NULL,
    country_iso3 TEXT DEFAULT NULL,
    country_iso_numeric TEXT DEFAULT NULL,
    population TEXT DEFAULT NULL,
    capital TEXT DEFAULT NULL,
    continent TEXT DEFAULT NULL,
    currency_name TEXT DEFAULT NULL,
    currency_code TEXT DEFAULT NULL,
    fips_code TEXT DEFAULT NULL,
    phone_prefix TEXT DEFAULT NULL
);
COMMENT ON TABLE country_data IS 'Original model name - CountryData.';

--
-- Table 'data_aircraft' generated from model 'DataAircraft'
--
CREATE TABLE IF NOT EXISTS data_aircraft (
    registration TEXT DEFAULT NULL,
    iata TEXT DEFAULT NULL,
    icao TEXT DEFAULT NULL,
    icao24 TEXT DEFAULT NULL
);
COMMENT ON TABLE data_aircraft IS 'Original model name - DataAircraft.';

--
-- Table 'data_airline' generated from model 'DataAirline'
--
CREATE TABLE IF NOT EXISTS data_airline (
    "name" TEXT DEFAULT NULL,
    iata TEXT DEFAULT NULL,
    icao TEXT DEFAULT NULL
);
COMMENT ON TABLE data_airline IS 'Original model name - DataAirline.';

--
-- Table 'data_departure' generated from model 'DataDeparture'
--
CREATE TABLE IF NOT EXISTS data_departure (
    airport TEXT DEFAULT NULL,
    timezone TEXT DEFAULT NULL,
    iata TEXT DEFAULT NULL,
    icao TEXT DEFAULT NULL,
    terminal TEXT DEFAULT NULL,
    gate TEXT DEFAULT NULL,
    delay INTEGER DEFAULT NULL,
    scheduled TEXT DEFAULT NULL,
    estimated TEXT DEFAULT NULL,
    actual TEXT DEFAULT NULL,
    estimated_runway TEXT DEFAULT NULL,
    actual_runway TEXT DEFAULT NULL,
    baggage TEXT DEFAULT NULL
);
COMMENT ON TABLE data_departure IS 'Original model name - DataDeparture.';

--
-- Table 'data_flight' generated from model 'DataFlight'
--
CREATE TABLE IF NOT EXISTS data_flight (
    flight_date TEXT DEFAULT NULL,
    flight_status TEXT DEFAULT NULL,
    departure TEXT DEFAULT NULL,
    arrival TEXT DEFAULT NULL,
    airline TEXT DEFAULT NULL,
    flight TEXT DEFAULT NULL,
    aircraft TEXT DEFAULT NULL,
    live TEXT DEFAULT NULL
);
COMMENT ON TABLE data_flight IS 'Original model name - DataFlight.';

--
-- Table 'data_flight2' generated from model 'DataFlight2'
--
CREATE TABLE IF NOT EXISTS data_flight2 (
    "number" TEXT DEFAULT NULL,
    iata TEXT DEFAULT NULL,
    icao TEXT DEFAULT NULL,
    codeshared TEXT DEFAULT NULL
);
COMMENT ON TABLE data_flight2 IS 'Original model name - DataFlight2.';

--
-- Table 'data_flight2_codeshared' generated from model 'DataFlight2Underscorecodeshared'
--
CREATE TABLE IF NOT EXISTS data_flight2_codeshared (
    airline_name TEXT DEFAULT NULL,
    airline_iata TEXT DEFAULT NULL,
    airline_icao TEXT DEFAULT NULL,
    flight_number TEXT DEFAULT NULL,
    flight_iata TEXT DEFAULT NULL,
    flight_icao TEXT DEFAULT NULL
);
COMMENT ON TABLE data_flight2_codeshared IS 'Original model name - DataFlight2_codeshared.';

--
-- Table 'data_routes' generated from model 'DataRoutes'
--
CREATE TABLE IF NOT EXISTS data_routes (
    departure TEXT DEFAULT NULL,
    arrival TEXT DEFAULT NULL,
    airline TEXT DEFAULT NULL,
    flight TEXT DEFAULT NULL
);
COMMENT ON TABLE data_routes IS 'Original model name - DataRoutes.';

--
-- Table 'data_routes_flight' generated from model 'DataRoutesUnderscoreflight'
--
CREATE TABLE IF NOT EXISTS data_routes_flight (
    "number" TEXT DEFAULT NULL
);
COMMENT ON TABLE data_routes_flight IS 'Original model name - DataRoutes_flight.';

--
-- Table 'datalive' generated from model 'Datalive'
--
CREATE TABLE IF NOT EXISTS datalive (
    updated TEXT DEFAULT NULL,
    latitude DECIMAL(20, 9) DEFAULT NULL,
    longitude DECIMAL(20, 9) DEFAULT NULL,
    altitude DECIMAL(20, 9) DEFAULT NULL,
    direction DECIMAL(20, 9) DEFAULT NULL,
    speed_horizontal DECIMAL(20, 9) DEFAULT NULL,
    speed_vertical DECIMAL(20, 9) DEFAULT NULL,
    is_ground BOOLEAN DEFAULT NULL
);
COMMENT ON TABLE datalive IS 'Original model name - Datalive.';

--
-- Table 'flights' generated from model 'Flights'
--
CREATE TABLE IF NOT EXISTS flights (
    pagination TEXT DEFAULT NULL,
    "data" JSON DEFAULT NULL
);
COMMENT ON TABLE flights IS 'Original model name - Flights.';

--
-- Table 'flights_future' generated from model 'FlightsFuture'
--
CREATE TABLE IF NOT EXISTS flights_future (
    pagination TEXT DEFAULT NULL,
    "data" JSON DEFAULT NULL
);
COMMENT ON TABLE flights_future IS 'Original model name - FlightsFuture.';

--
-- Table 'future_flight_aircraft' generated from model 'FutureFlightAircraft'
--
CREATE TABLE IF NOT EXISTS future_flight_aircraft (
    model_code TEXT DEFAULT NULL,
    model_text TEXT DEFAULT NULL
);
COMMENT ON TABLE future_flight_aircraft IS 'Original model name - FutureFlightAircraft.';
COMMENT ON COLUMN future_flight_aircraft.model_code IS 'Original param name - modelCode.';
COMMENT ON COLUMN future_flight_aircraft.model_text IS 'Original param name - modelText.';

--
-- Table 'future_flight_airline' generated from model 'FutureFlightAirline'
--
CREATE TABLE IF NOT EXISTS future_flight_airline (
    "name" TEXT DEFAULT NULL,
    iata_code TEXT DEFAULT NULL,
    icao_code TEXT DEFAULT NULL
);
COMMENT ON TABLE future_flight_airline IS 'Original model name - FutureFlightAirline.';
COMMENT ON COLUMN future_flight_airline.iata_code IS 'Original param name - iataCode.';
COMMENT ON COLUMN future_flight_airline.icao_code IS 'Original param name - icaoCode.';

--
-- Table 'future_flight_data' generated from model 'FutureFlightData'
--
CREATE TABLE IF NOT EXISTS future_flight_data (
    weekday TEXT DEFAULT NULL,
    departure TEXT DEFAULT NULL,
    arrival TEXT DEFAULT NULL,
    aircraft TEXT DEFAULT NULL,
    airline TEXT DEFAULT NULL,
    flight TEXT DEFAULT NULL,
    codeshared TEXT DEFAULT NULL
);
COMMENT ON TABLE future_flight_data IS 'Original model name - FutureFlightData.';

--
-- Table 'future_flight_data_codeshared' generated from model 'FutureFlightDataUnderscorecodeshared'
--
CREATE TABLE IF NOT EXISTS future_flight_data_codeshared (
    airline TEXT DEFAULT NULL,
    flight TEXT DEFAULT NULL
);
COMMENT ON TABLE future_flight_data_codeshared IS 'Original model name - FutureFlightData_codeshared.';

--
-- Table 'future_flight_info' generated from model 'FutureFlightInfo'
--
CREATE TABLE IF NOT EXISTS future_flight_info (
    "number" TEXT DEFAULT NULL,
    iata_number TEXT DEFAULT NULL,
    icao_number TEXT DEFAULT NULL
);
COMMENT ON TABLE future_flight_info IS 'Original model name - FutureFlightInfo.';
COMMENT ON COLUMN future_flight_info.iata_number IS 'Original param name - iataNumber.';
COMMENT ON COLUMN future_flight_info.icao_number IS 'Original param name - icaoNumber.';

--
-- Table 'future_flight_point' generated from model 'FutureFlightPoint'
--
CREATE TABLE IF NOT EXISTS future_flight_point (
    iata_code TEXT DEFAULT NULL,
    icao_code TEXT DEFAULT NULL,
    terminal TEXT DEFAULT NULL,
    gate TEXT DEFAULT NULL,
    scheduled_time TEXT DEFAULT NULL
);
COMMENT ON TABLE future_flight_point IS 'Original model name - FutureFlightPoint.';
COMMENT ON COLUMN future_flight_point.iata_code IS 'Original param name - iataCode.';
COMMENT ON COLUMN future_flight_point.icao_code IS 'Original param name - icaoCode.';
COMMENT ON COLUMN future_flight_point.scheduled_time IS 'Original param name - scheduledTime.';

--
-- Table 'pagination' generated from model 'Pagination'
--
CREATE TABLE IF NOT EXISTS pagination (
    "limit" BIGINT DEFAULT NULL,
    "offset" BIGINT DEFAULT NULL,
    "count" BIGINT DEFAULT NULL,
    total BIGINT DEFAULT NULL
);
COMMENT ON TABLE pagination IS 'Original model name - Pagination.';

--
-- Table 'route_airline' generated from model 'RouteAirline'
--
CREATE TABLE IF NOT EXISTS route_airline (
    "name" TEXT DEFAULT NULL,
    callsign TEXT DEFAULT NULL,
    iata TEXT DEFAULT NULL,
    icao TEXT DEFAULT NULL
);
COMMENT ON TABLE route_airline IS 'Original model name - RouteAirline.';

--
-- Table 'route_endpoint' generated from model 'RouteEndpoint'
--
CREATE TABLE IF NOT EXISTS route_endpoint (
    airport TEXT DEFAULT NULL,
    timezone TEXT DEFAULT NULL,
    iata TEXT DEFAULT NULL,
    icao TEXT DEFAULT NULL,
    terminal TEXT DEFAULT NULL,
    "time" TEXT DEFAULT NULL
);
COMMENT ON TABLE route_endpoint IS 'Original model name - RouteEndpoint.';

--
-- Table 'routes' generated from model 'Routes'
--
CREATE TABLE IF NOT EXISTS routes (
    pagination TEXT DEFAULT NULL,
    "data" JSON DEFAULT NULL
);
COMMENT ON TABLE routes IS 'Original model name - Routes.';

--
-- Table 'tax_data' generated from model 'TaxData'
--
CREATE TABLE IF NOT EXISTS tax_data (
    "id" TEXT DEFAULT NULL,
    tax_id TEXT DEFAULT NULL,
    tax_name TEXT DEFAULT NULL,
    iata_code TEXT DEFAULT NULL
);
COMMENT ON TABLE tax_data IS 'Original model name - TaxData.';

--
-- Table 'taxes' generated from model 'Taxes'
--
CREATE TABLE IF NOT EXISTS taxes (
    pagination TEXT DEFAULT NULL,
    "data" JSON DEFAULT NULL
);
COMMENT ON TABLE taxes IS 'Original model name - Taxes.';

--
-- Table 'timetable' generated from model 'Timetable'
--
CREATE TABLE IF NOT EXISTS timetable (
    pagination TEXT DEFAULT NULL,
    "data" JSON DEFAULT NULL
);
COMMENT ON TABLE timetable IS 'Original model name - Timetable.';

--
-- Table 'timetable_aircraft' generated from model 'TimetableAircraft'
--
CREATE TABLE IF NOT EXISTS timetable_aircraft (
    icao24 TEXT DEFAULT NULL,
    icao_code TEXT DEFAULT NULL,
    reg_number TEXT DEFAULT NULL
);
COMMENT ON TABLE timetable_aircraft IS 'Original model name - TimetableAircraft.';
COMMENT ON COLUMN timetable_aircraft.icao_code IS 'Original param name - icaoCode.';
COMMENT ON COLUMN timetable_aircraft.reg_number IS 'Original param name - regNumber.';

--
-- Table 'timetable_airline' generated from model 'TimetableAirline'
--
CREATE TABLE IF NOT EXISTS timetable_airline (
    iata_code TEXT DEFAULT NULL,
    icao_code TEXT DEFAULT NULL,
    "name" TEXT DEFAULT NULL
);
COMMENT ON TABLE timetable_airline IS 'Original model name - TimetableAirline.';
COMMENT ON COLUMN timetable_airline.iata_code IS 'Original param name - iataCode.';
COMMENT ON COLUMN timetable_airline.icao_code IS 'Original param name - icaoCode.';

--
-- Table 'timetable_data' generated from model 'TimetableData'
--
CREATE TABLE IF NOT EXISTS timetable_data (
    aircraft TEXT DEFAULT NULL,
    airline TEXT DEFAULT NULL,
    arrival TEXT DEFAULT NULL,
    codeshared TEXT DEFAULT NULL,
    departure TEXT DEFAULT NULL,
    flight TEXT DEFAULT NULL,
    status TEXT DEFAULT NULL,
    "type" TEXT DEFAULT NULL
);
COMMENT ON TABLE timetable_data IS 'Original model name - TimetableData.';

--
-- Table 'timetable_data_codeshared' generated from model 'TimetableDataUnderscorecodeshared'
--
CREATE TABLE IF NOT EXISTS timetable_data_codeshared (
    airline TEXT DEFAULT NULL,
    flight TEXT DEFAULT NULL
);
COMMENT ON TABLE timetable_data_codeshared IS 'Original model name - TimetableData_codeshared.';

--
-- Table 'timetable_flight' generated from model 'TimetableFlight'
--
CREATE TABLE IF NOT EXISTS timetable_flight (
    iata_number TEXT DEFAULT NULL,
    icao_number TEXT DEFAULT NULL,
    "number" TEXT DEFAULT NULL
);
COMMENT ON TABLE timetable_flight IS 'Original model name - TimetableFlight.';
COMMENT ON COLUMN timetable_flight.iata_number IS 'Original param name - iataNumber.';
COMMENT ON COLUMN timetable_flight.icao_number IS 'Original param name - icaoNumber.';

--
-- Table 'timetable_schedule' generated from model 'TimetableSchedule'
--
CREATE TABLE IF NOT EXISTS timetable_schedule (
    actual_runway TEXT DEFAULT NULL,
    actual_time TEXT DEFAULT NULL,
    baggage TEXT DEFAULT NULL,
    delay TEXT DEFAULT NULL,
    estimated_runway TEXT DEFAULT NULL,
    estimated_time TEXT DEFAULT NULL,
    gate TEXT DEFAULT NULL,
    iata_code TEXT DEFAULT NULL,
    icao_code TEXT DEFAULT NULL,
    scheduled_time TEXT DEFAULT NULL,
    terminal TEXT DEFAULT NULL
);
COMMENT ON TABLE timetable_schedule IS 'Original model name - TimetableSchedule.';
COMMENT ON COLUMN timetable_schedule.actual_runway IS 'Original param name - actualRunway.';
COMMENT ON COLUMN timetable_schedule.actual_time IS 'Original param name - actualTime.';
COMMENT ON COLUMN timetable_schedule.estimated_runway IS 'Original param name - estimatedRunway.';
COMMENT ON COLUMN timetable_schedule.estimated_time IS 'Original param name - estimatedTime.';
COMMENT ON COLUMN timetable_schedule.iata_code IS 'Original param name - iataCode.';
COMMENT ON COLUMN timetable_schedule.icao_code IS 'Original param name - icaoCode.';
COMMENT ON COLUMN timetable_schedule.scheduled_time IS 'Original param name - scheduledTime.';

