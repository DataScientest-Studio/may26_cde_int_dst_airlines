--
-- "AviationStack"
-- Prepared SQL queries for 'AirPlaneData' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'air_plane_data'
--
SELECT "id", airplane_id, registration_number, production_line, iata_type, model_name, model_code, icao_code_hex, iata_code_short, iata_code_long, construction_number, test_registration_number, rollout_date, first_flight_date, delivery_date, registration_date, line_number, plane_series, airline_iata_code, airline_icao_code, plane_owner, engines_count, engines_type, plane_age, plane_status, plane_class FROM air_plane_data WHERE 1=1;

--
-- INSERT template for table 'air_plane_data'
--
INSERT INTO air_plane_data ("id", airplane_id, registration_number, production_line, iata_type, model_name, model_code, icao_code_hex, iata_code_short, iata_code_long, construction_number, test_registration_number, rollout_date, first_flight_date, delivery_date, registration_date, line_number, plane_series, airline_iata_code, airline_icao_code, plane_owner, engines_count, engines_type, plane_age, plane_status, plane_class) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table 'air_plane_data'
--
UPDATE air_plane_data SET "id" = ?, airplane_id = ?, registration_number = ?, production_line = ?, iata_type = ?, model_name = ?, model_code = ?, icao_code_hex = ?, iata_code_short = ?, iata_code_long = ?, construction_number = ?, test_registration_number = ?, rollout_date = ?, first_flight_date = ?, delivery_date = ?, registration_date = ?, line_number = ?, plane_series = ?, airline_iata_code = ?, airline_icao_code = ?, plane_owner = ?, engines_count = ?, engines_type = ?, plane_age = ?, plane_status = ?, plane_class = ? WHERE 1=2;

--
-- DELETE template for table 'air_plane_data'
--
DELETE FROM air_plane_data WHERE 1=2;

