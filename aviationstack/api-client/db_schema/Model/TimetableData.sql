--
-- "AviationStack"
-- Prepared SQL queries for 'TimetableData' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'timetable_data'
--
SELECT aircraft, airline, arrival, codeshared, departure, flight, status, "type" FROM timetable_data WHERE 1=1;

--
-- INSERT template for table 'timetable_data'
--
INSERT INTO timetable_data (aircraft, airline, arrival, codeshared, departure, flight, status, "type") VALUES (?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table 'timetable_data'
--
UPDATE timetable_data SET aircraft = ?, airline = ?, arrival = ?, codeshared = ?, departure = ?, flight = ?, status = ?, "type" = ? WHERE 1=2;

--
-- DELETE template for table 'timetable_data'
--
DELETE FROM timetable_data WHERE 1=2;

