--
-- "AviationStack"
-- Prepared SQL queries for 'RouteEndpoint' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'route_endpoint'
--
SELECT airport, timezone, iata, icao, terminal, "time" FROM route_endpoint WHERE 1=1;

--
-- INSERT template for table 'route_endpoint'
--
INSERT INTO route_endpoint (airport, timezone, iata, icao, terminal, "time") VALUES (?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table 'route_endpoint'
--
UPDATE route_endpoint SET airport = ?, timezone = ?, iata = ?, icao = ?, terminal = ?, "time" = ? WHERE 1=2;

--
-- DELETE template for table 'route_endpoint'
--
DELETE FROM route_endpoint WHERE 1=2;

