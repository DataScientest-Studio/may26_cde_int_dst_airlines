--
-- "AviationStack"
-- Prepared SQL queries for 'DataRoutes' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'data_routes'
--
SELECT departure, arrival, airline, flight FROM data_routes WHERE 1=1;

--
-- INSERT template for table 'data_routes'
--
INSERT INTO data_routes (departure, arrival, airline, flight) VALUES (?, ?, ?, ?);

--
-- UPDATE template for table 'data_routes'
--
UPDATE data_routes SET departure = ?, arrival = ?, airline = ?, flight = ? WHERE 1=2;

--
-- DELETE template for table 'data_routes'
--
DELETE FROM data_routes WHERE 1=2;

