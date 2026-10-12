--
-- "AviationStack"
-- Prepared SQL queries for 'AirPlanes' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'air_planes'
--
SELECT pagination, "data" FROM air_planes WHERE 1=1;

--
-- INSERT template for table 'air_planes'
--
INSERT INTO air_planes (pagination, "data") VALUES (?, ?);

--
-- UPDATE template for table 'air_planes'
--
UPDATE air_planes SET pagination = ?, "data" = ? WHERE 1=2;

--
-- DELETE template for table 'air_planes'
--
DELETE FROM air_planes WHERE 1=2;

