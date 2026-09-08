--
-- "AviationStack"
-- Prepared SQL queries for 'TimetableSchedule' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'timetable_schedule'
--
SELECT actual_runway, actual_time, baggage, delay, estimated_runway, estimated_time, gate, iata_code, icao_code, scheduled_time, terminal FROM timetable_schedule WHERE 1=1;

--
-- INSERT template for table 'timetable_schedule'
--
INSERT INTO timetable_schedule (actual_runway, actual_time, baggage, delay, estimated_runway, estimated_time, gate, iata_code, icao_code, scheduled_time, terminal) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table 'timetable_schedule'
--
UPDATE timetable_schedule SET actual_runway = ?, actual_time = ?, baggage = ?, delay = ?, estimated_runway = ?, estimated_time = ?, gate = ?, iata_code = ?, icao_code = ?, scheduled_time = ?, terminal = ? WHERE 1=2;

--
-- DELETE template for table 'timetable_schedule'
--
DELETE FROM timetable_schedule WHERE 1=2;

