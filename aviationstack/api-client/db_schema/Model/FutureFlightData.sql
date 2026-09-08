--
-- "AviationStack"
-- Prepared SQL queries for 'FutureFlightData' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'future_flight_data'
--
SELECT weekday, departure, arrival, aircraft, airline, flight, codeshared FROM future_flight_data WHERE 1=1;

--
-- INSERT template for table 'future_flight_data'
--
INSERT INTO future_flight_data (weekday, departure, arrival, aircraft, airline, flight, codeshared) VALUES (?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table 'future_flight_data'
--
UPDATE future_flight_data SET weekday = ?, departure = ?, arrival = ?, aircraft = ?, airline = ?, flight = ?, codeshared = ? WHERE 1=2;

--
-- DELETE template for table 'future_flight_data'
--
DELETE FROM future_flight_data WHERE 1=2;

