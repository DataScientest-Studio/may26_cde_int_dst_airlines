--
-- "AviationStack"
-- Prepared SQL queries for 'FutureFlightAirline' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'future_flight_airline'
--
SELECT "name", iata_code, icao_code FROM future_flight_airline WHERE 1=1;

--
-- INSERT template for table 'future_flight_airline'
--
INSERT INTO future_flight_airline ("name", iata_code, icao_code) VALUES (?, ?, ?);

--
-- UPDATE template for table 'future_flight_airline'
--
UPDATE future_flight_airline SET "name" = ?, iata_code = ?, icao_code = ? WHERE 1=2;

--
-- DELETE template for table 'future_flight_airline'
--
DELETE FROM future_flight_airline WHERE 1=2;

