--
-- "AviationStack"
-- Prepared SQL queries for 'DataDeparture' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'data_departure'
--
SELECT airport, timezone, iata, icao, terminal, gate, delay, scheduled, estimated, actual, estimated_runway, actual_runway, baggage FROM data_departure WHERE 1=1;

--
-- INSERT template for table 'data_departure'
--
INSERT INTO data_departure (airport, timezone, iata, icao, terminal, gate, delay, scheduled, estimated, actual, estimated_runway, actual_runway, baggage) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table 'data_departure'
--
UPDATE data_departure SET airport = ?, timezone = ?, iata = ?, icao = ?, terminal = ?, gate = ?, delay = ?, scheduled = ?, estimated = ?, actual = ?, estimated_runway = ?, actual_runway = ?, baggage = ? WHERE 1=2;

--
-- DELETE template for table 'data_departure'
--
DELETE FROM data_departure WHERE 1=2;

