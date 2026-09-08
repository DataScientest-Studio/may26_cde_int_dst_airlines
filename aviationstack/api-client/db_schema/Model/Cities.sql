--
-- "AviationStack"
-- Prepared SQL queries for 'Cities' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'cities'
--
SELECT pagination, "data" FROM cities WHERE 1=1;

--
-- INSERT template for table 'cities'
--
INSERT INTO cities (pagination, "data") VALUES (?, ?);

--
-- UPDATE template for table 'cities'
--
UPDATE cities SET pagination = ?, "data" = ? WHERE 1=2;

--
-- DELETE template for table 'cities'
--
DELETE FROM cities WHERE 1=2;

