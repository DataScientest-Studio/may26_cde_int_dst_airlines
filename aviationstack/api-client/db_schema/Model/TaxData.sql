--
-- "AviationStack"
-- Prepared SQL queries for 'TaxData' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'tax_data'
--
SELECT "id", tax_id, tax_name, iata_code FROM tax_data WHERE 1=1;

--
-- INSERT template for table 'tax_data'
--
INSERT INTO tax_data ("id", tax_id, tax_name, iata_code) VALUES (?, ?, ?, ?);

--
-- UPDATE template for table 'tax_data'
--
UPDATE tax_data SET "id" = ?, tax_id = ?, tax_name = ?, iata_code = ? WHERE 1=2;

--
-- DELETE template for table 'tax_data'
--
DELETE FROM tax_data WHERE 1=2;

