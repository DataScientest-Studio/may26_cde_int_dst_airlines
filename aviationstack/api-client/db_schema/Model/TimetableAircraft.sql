--
-- "AviationStack"
-- Prepared SQL queries for 'TimetableAircraft' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'timetable_aircraft'
--
SELECT icao24, icao_code, reg_number FROM timetable_aircraft WHERE 1=1;

--
-- INSERT template for table 'timetable_aircraft'
--
INSERT INTO timetable_aircraft (icao24, icao_code, reg_number) VALUES (?, ?, ?);

--
-- UPDATE template for table 'timetable_aircraft'
--
UPDATE timetable_aircraft SET icao24 = ?, icao_code = ?, reg_number = ? WHERE 1=2;

--
-- DELETE template for table 'timetable_aircraft'
--
DELETE FROM timetable_aircraft WHERE 1=2;

