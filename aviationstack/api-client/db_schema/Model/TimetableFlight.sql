--
-- "AviationStack"
-- Prepared SQL queries for 'TimetableFlight' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'timetable_flight'
--
SELECT iata_number, icao_number, "number" FROM timetable_flight WHERE 1=1;

--
-- INSERT template for table 'timetable_flight'
--
INSERT INTO timetable_flight (iata_number, icao_number, "number") VALUES (?, ?, ?);

--
-- UPDATE template for table 'timetable_flight'
--
UPDATE timetable_flight SET iata_number = ?, icao_number = ?, "number" = ? WHERE 1=2;

--
-- DELETE template for table 'timetable_flight'
--
DELETE FROM timetable_flight WHERE 1=2;

