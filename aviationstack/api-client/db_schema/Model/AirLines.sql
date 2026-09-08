--
-- "AviationStack"
-- Prepared SQL queries for 'AirLines' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'air_lines'
--
SELECT pagination, "data" FROM air_lines WHERE 1=1;

--
-- INSERT template for table 'air_lines'
--
INSERT INTO air_lines (pagination, "data") VALUES (?, ?);

--
-- UPDATE template for table 'air_lines'
--
UPDATE air_lines SET pagination = ?, "data" = ? WHERE 1=2;

--
-- DELETE template for table 'air_lines'
--
DELETE FROM air_lines WHERE 1=2;

