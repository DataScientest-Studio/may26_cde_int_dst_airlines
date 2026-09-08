--
-- "AviationStack"
-- Prepared SQL queries for 'CountryData' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'country_data'
--
SELECT "id", country_id, country_name, country_iso2, country_iso3, country_iso_numeric, population, capital, continent, currency_name, currency_code, fips_code, phone_prefix FROM country_data WHERE 1=1;

--
-- INSERT template for table 'country_data'
--
INSERT INTO country_data ("id", country_id, country_name, country_iso2, country_iso3, country_iso_numeric, population, capital, continent, currency_name, currency_code, fips_code, phone_prefix) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table 'country_data'
--
UPDATE country_data SET "id" = ?, country_id = ?, country_name = ?, country_iso2 = ?, country_iso3 = ?, country_iso_numeric = ?, population = ?, capital = ?, continent = ?, currency_name = ?, currency_code = ?, fips_code = ?, phone_prefix = ? WHERE 1=2;

--
-- DELETE template for table 'country_data'
--
DELETE FROM country_data WHERE 1=2;

