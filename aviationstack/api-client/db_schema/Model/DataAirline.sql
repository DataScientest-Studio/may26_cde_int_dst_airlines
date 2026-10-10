--
-- "AviationStack"
-- Prepared SQL queries for 'DataAirline' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'data_airline'
--
SELECT "name", iata, icao FROM data_airline WHERE 1=1;

--
-- INSERT template for table 'data_airline'
--
INSERT INTO data_airline ("name", iata, icao) VALUES (?, ?, ?);

--
-- UPDATE template for table 'data_airline'
--
UPDATE data_airline SET "name" = ?, iata = ?, icao = ? WHERE 1=2;

--
-- DELETE template for table 'data_airline'
--
DELETE FROM data_airline WHERE 1=2;

