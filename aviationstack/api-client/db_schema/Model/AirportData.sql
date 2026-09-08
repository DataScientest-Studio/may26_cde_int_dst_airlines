--
-- "AviationStack"
-- Prepared SQL queries for 'AirportData' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'airport_data'
--
SELECT "id", airport_id, airport_name, iata_code, icao_code, latitude, longitude, geoname_id, timezone, gmt, phone_number, country_name, country_iso2, city_iata_code FROM airport_data WHERE 1=1;

--
-- INSERT template for table 'airport_data'
--
INSERT INTO airport_data ("id", airport_id, airport_name, iata_code, icao_code, latitude, longitude, geoname_id, timezone, gmt, phone_number, country_name, country_iso2, city_iata_code) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table 'airport_data'
--
UPDATE airport_data SET "id" = ?, airport_id = ?, airport_name = ?, iata_code = ?, icao_code = ?, latitude = ?, longitude = ?, geoname_id = ?, timezone = ?, gmt = ?, phone_number = ?, country_name = ?, country_iso2 = ?, city_iata_code = ? WHERE 1=2;

--
-- DELETE template for table 'airport_data'
--
DELETE FROM airport_data WHERE 1=2;

