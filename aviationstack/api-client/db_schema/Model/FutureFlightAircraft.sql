--
-- "AviationStack"
-- Prepared SQL queries for 'FutureFlightAircraft' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'future_flight_aircraft'
--
SELECT model_code, model_text FROM future_flight_aircraft WHERE 1=1;

--
-- INSERT template for table 'future_flight_aircraft'
--
INSERT INTO future_flight_aircraft (model_code, model_text) VALUES (?, ?);

--
-- UPDATE template for table 'future_flight_aircraft'
--
UPDATE future_flight_aircraft SET model_code = ?, model_text = ? WHERE 1=2;

--
-- DELETE template for table 'future_flight_aircraft'
--
DELETE FROM future_flight_aircraft WHERE 1=2;

