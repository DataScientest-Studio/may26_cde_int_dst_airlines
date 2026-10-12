--
-- "AviationStack"
-- Prepared SQL queries for 'Datalive' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'datalive'
--
SELECT updated, latitude, longitude, altitude, direction, speed_horizontal, speed_vertical, is_ground FROM datalive WHERE 1=1;

--
-- INSERT template for table 'datalive'
--
INSERT INTO datalive (updated, latitude, longitude, altitude, direction, speed_horizontal, speed_vertical, is_ground) VALUES (?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table 'datalive'
--
UPDATE datalive SET updated = ?, latitude = ?, longitude = ?, altitude = ?, direction = ?, speed_horizontal = ?, speed_vertical = ?, is_ground = ? WHERE 1=2;

--
-- DELETE template for table 'datalive'
--
DELETE FROM datalive WHERE 1=2;

