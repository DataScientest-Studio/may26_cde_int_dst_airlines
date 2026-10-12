--
-- "AviationStack"
-- Prepared SQL queries for 'DataFlight2_codeshared' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'data_flight2_codeshared'
--
SELECT airline_name, airline_iata, airline_icao, flight_number, flight_iata, flight_icao FROM data_flight2_codeshared WHERE 1=1;

--
-- INSERT template for table 'data_flight2_codeshared'
--
INSERT INTO data_flight2_codeshared (airline_name, airline_iata, airline_icao, flight_number, flight_iata, flight_icao) VALUES (?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table 'data_flight2_codeshared'
--
UPDATE data_flight2_codeshared SET airline_name = ?, airline_iata = ?, airline_icao = ?, flight_number = ?, flight_iata = ?, flight_icao = ? WHERE 1=2;

--
-- DELETE template for table 'data_flight2_codeshared'
--
DELETE FROM data_flight2_codeshared WHERE 1=2;

