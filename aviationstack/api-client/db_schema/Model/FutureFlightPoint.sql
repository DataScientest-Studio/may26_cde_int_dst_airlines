--
-- "AviationStack"
-- Prepared SQL queries for 'FutureFlightPoint' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'future_flight_point'
--
SELECT iata_code, icao_code, terminal, gate, scheduled_time FROM future_flight_point WHERE 1=1;

--
-- INSERT template for table 'future_flight_point'
--
INSERT INTO future_flight_point (iata_code, icao_code, terminal, gate, scheduled_time) VALUES (?, ?, ?, ?, ?);

--
-- UPDATE template for table 'future_flight_point'
--
UPDATE future_flight_point SET iata_code = ?, icao_code = ?, terminal = ?, gate = ?, scheduled_time = ? WHERE 1=2;

--
-- DELETE template for table 'future_flight_point'
--
DELETE FROM future_flight_point WHERE 1=2;

