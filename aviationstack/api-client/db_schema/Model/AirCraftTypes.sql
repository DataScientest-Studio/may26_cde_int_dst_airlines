--
-- "AviationStack"
-- Prepared SQL queries for 'AirCraftTypes' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'air_craft_types'
--
SELECT pagination, "data" FROM air_craft_types WHERE 1=1;

--
-- INSERT template for table 'air_craft_types'
--
INSERT INTO air_craft_types (pagination, "data") VALUES (?, ?);

--
-- UPDATE template for table 'air_craft_types'
--
UPDATE air_craft_types SET pagination = ?, "data" = ? WHERE 1=2;

--
-- DELETE template for table 'air_craft_types'
--
DELETE FROM air_craft_types WHERE 1=2;

