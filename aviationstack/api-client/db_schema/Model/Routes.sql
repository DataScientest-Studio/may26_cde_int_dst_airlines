--
-- "AviationStack"
-- Prepared SQL queries for 'Routes' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'routes'
--
SELECT pagination, "data" FROM routes WHERE 1=1;

--
-- INSERT template for table 'routes'
--
INSERT INTO routes (pagination, "data") VALUES (?, ?);

--
-- UPDATE template for table 'routes'
--
UPDATE routes SET pagination = ?, "data" = ? WHERE 1=2;

--
-- DELETE template for table 'routes'
--
DELETE FROM routes WHERE 1=2;

