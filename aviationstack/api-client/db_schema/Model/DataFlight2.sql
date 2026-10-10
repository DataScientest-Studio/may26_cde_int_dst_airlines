--
-- "AviationStack"
-- Prepared SQL queries for 'DataFlight2' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'data_flight2'
--
SELECT "number", iata, icao, codeshared FROM data_flight2 WHERE 1=1;

--
-- INSERT template for table 'data_flight2'
--
INSERT INTO data_flight2 ("number", iata, icao, codeshared) VALUES (?, ?, ?, ?);

--
-- UPDATE template for table 'data_flight2'
--
UPDATE data_flight2 SET "number" = ?, iata = ?, icao = ?, codeshared = ? WHERE 1=2;

--
-- DELETE template for table 'data_flight2'
--
DELETE FROM data_flight2 WHERE 1=2;

