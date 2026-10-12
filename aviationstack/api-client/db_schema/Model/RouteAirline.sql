--
-- "AviationStack"
-- Prepared SQL queries for 'RouteAirline' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'route_airline'
--
SELECT "name", callsign, iata, icao FROM route_airline WHERE 1=1;

--
-- INSERT template for table 'route_airline'
--
INSERT INTO route_airline ("name", callsign, iata, icao) VALUES (?, ?, ?, ?);

--
-- UPDATE template for table 'route_airline'
--
UPDATE route_airline SET "name" = ?, callsign = ?, iata = ?, icao = ? WHERE 1=2;

--
-- DELETE template for table 'route_airline'
--
DELETE FROM route_airline WHERE 1=2;

