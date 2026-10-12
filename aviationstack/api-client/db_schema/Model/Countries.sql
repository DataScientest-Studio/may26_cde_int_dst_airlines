--
-- "AviationStack"
-- Prepared SQL queries for 'Countries' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'countries'
--
SELECT pagination, "data" FROM countries WHERE 1=1;

--
-- INSERT template for table 'countries'
--
INSERT INTO countries (pagination, "data") VALUES (?, ?);

--
-- UPDATE template for table 'countries'
--
UPDATE countries SET pagination = ?, "data" = ? WHERE 1=2;

--
-- DELETE template for table 'countries'
--
DELETE FROM countries WHERE 1=2;

