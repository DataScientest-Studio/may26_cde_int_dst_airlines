--
-- "AviationStack"
-- Prepared SQL queries for 'CityData' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'city_data'
--
SELECT "id", city_id, city_name, iata_code, country_iso2, latitude, longitude, timezone, gmt, geoname_id FROM city_data WHERE 1=1;

--
-- INSERT template for table 'city_data'
--
INSERT INTO city_data ("id", city_id, city_name, iata_code, country_iso2, latitude, longitude, timezone, gmt, geoname_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table 'city_data'
--
UPDATE city_data SET "id" = ?, city_id = ?, city_name = ?, iata_code = ?, country_iso2 = ?, latitude = ?, longitude = ?, timezone = ?, gmt = ?, geoname_id = ? WHERE 1=2;

--
-- DELETE template for table 'city_data'
--
DELETE FROM city_data WHERE 1=2;

