--
-- "AviationStack"
-- Prepared SQL queries for 'TimetableAirline' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'timetable_airline'
--
SELECT iata_code, icao_code, "name" FROM timetable_airline WHERE 1=1;

--
-- INSERT template for table 'timetable_airline'
--
INSERT INTO timetable_airline (iata_code, icao_code, "name") VALUES (?, ?, ?);

--
-- UPDATE template for table 'timetable_airline'
--
UPDATE timetable_airline SET iata_code = ?, icao_code = ?, "name" = ? WHERE 1=2;

--
-- DELETE template for table 'timetable_airline'
--
DELETE FROM timetable_airline WHERE 1=2;

