--
-- "AviationStack"
-- Prepared SQL queries for 'Timetable' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'timetable'
--
SELECT pagination, "data" FROM timetable WHERE 1=1;

--
-- INSERT template for table 'timetable'
--
INSERT INTO timetable (pagination, "data") VALUES (?, ?);

--
-- UPDATE template for table 'timetable'
--
UPDATE timetable SET pagination = ?, "data" = ? WHERE 1=2;

--
-- DELETE template for table 'timetable'
--
DELETE FROM timetable WHERE 1=2;

