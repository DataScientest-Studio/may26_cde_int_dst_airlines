--
-- "AviationStack"
-- Prepared SQL queries for 'Taxes' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'taxes'
--
SELECT pagination, "data" FROM taxes WHERE 1=1;

--
-- INSERT template for table 'taxes'
--
INSERT INTO taxes (pagination, "data") VALUES (?, ?);

--
-- UPDATE template for table 'taxes'
--
UPDATE taxes SET pagination = ?, "data" = ? WHERE 1=2;

--
-- DELETE template for table 'taxes'
--
DELETE FROM taxes WHERE 1=2;

