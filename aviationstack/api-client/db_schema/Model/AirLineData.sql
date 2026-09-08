--
-- "AviationStack"
-- Prepared SQL queries for 'AirLineData' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'air_line_data'
--
SELECT "id", airline_id, airline_name, iata_code, iata_prefix_accounting, icao_code, callsign, "type", status, fleet_size, fleet_average_age, date_founded, hub_code, country_name, country_iso2 FROM air_line_data WHERE 1=1;

--
-- INSERT template for table 'air_line_data'
--
INSERT INTO air_line_data ("id", airline_id, airline_name, iata_code, iata_prefix_accounting, icao_code, callsign, "type", status, fleet_size, fleet_average_age, date_founded, hub_code, country_name, country_iso2) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table 'air_line_data'
--
UPDATE air_line_data SET "id" = ?, airline_id = ?, airline_name = ?, iata_code = ?, iata_prefix_accounting = ?, icao_code = ?, callsign = ?, "type" = ?, status = ?, fleet_size = ?, fleet_average_age = ?, date_founded = ?, hub_code = ?, country_name = ?, country_iso2 = ? WHERE 1=2;

--
-- DELETE template for table 'air_line_data'
--
DELETE FROM air_line_data WHERE 1=2;

