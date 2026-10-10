--
-- "AviationStack"
-- Prepared SQL queries for 'FutureFlightInfo' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'future_flight_info'
--
SELECT "number", iata_number, icao_number FROM future_flight_info WHERE 1=1;

--
-- INSERT template for table 'future_flight_info'
--
INSERT INTO future_flight_info ("number", iata_number, icao_number) VALUES (?, ?, ?);

--
-- UPDATE template for table 'future_flight_info'
--
UPDATE future_flight_info SET "number" = ?, iata_number = ?, icao_number = ? WHERE 1=2;

--
-- DELETE template for table 'future_flight_info'
--
DELETE FROM future_flight_info WHERE 1=2;

