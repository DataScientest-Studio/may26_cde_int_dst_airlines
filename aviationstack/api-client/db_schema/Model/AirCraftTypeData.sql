--
-- "AviationStack"
-- Prepared SQL queries for 'AirCraftTypeData' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'air_craft_type_data'
--
SELECT "id", plane_type_id, aircraft_name, iata_code FROM air_craft_type_data WHERE 1=1;

--
-- INSERT template for table 'air_craft_type_data'
--
INSERT INTO air_craft_type_data ("id", plane_type_id, aircraft_name, iata_code) VALUES (?, ?, ?, ?);

--
-- UPDATE template for table 'air_craft_type_data'
--
UPDATE air_craft_type_data SET "id" = ?, plane_type_id = ?, aircraft_name = ?, iata_code = ? WHERE 1=2;

--
-- DELETE template for table 'air_craft_type_data'
--
DELETE FROM air_craft_type_data WHERE 1=2;

