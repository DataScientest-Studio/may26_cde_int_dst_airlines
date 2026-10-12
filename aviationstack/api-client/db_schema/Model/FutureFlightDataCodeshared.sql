--
-- "AviationStack"
-- Prepared SQL queries for 'FutureFlightData_codeshared' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'future_flight_data_codeshared'
--
SELECT airline, flight FROM future_flight_data_codeshared WHERE 1=1;

--
-- INSERT template for table 'future_flight_data_codeshared'
--
INSERT INTO future_flight_data_codeshared (airline, flight) VALUES (?, ?);

--
-- UPDATE template for table 'future_flight_data_codeshared'
--
UPDATE future_flight_data_codeshared SET airline = ?, flight = ? WHERE 1=2;

--
-- DELETE template for table 'future_flight_data_codeshared'
--
DELETE FROM future_flight_data_codeshared WHERE 1=2;

