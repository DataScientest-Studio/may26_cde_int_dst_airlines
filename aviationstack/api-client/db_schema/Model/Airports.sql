--
-- "AviationStack"
-- Prepared SQL queries for 'Airports' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'airports'
--
SELECT pagination, "data" FROM airports WHERE 1=1;

--
-- INSERT template for table 'airports'
--
INSERT INTO airports (pagination, "data") VALUES (?, ?);

--
-- UPDATE template for table 'airports'
--
UPDATE airports SET pagination = ?, "data" = ? WHERE 1=2;

--
-- DELETE template for table 'airports'
--
DELETE FROM airports WHERE 1=2;

