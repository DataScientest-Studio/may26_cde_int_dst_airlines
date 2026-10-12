--
-- "AviationStack"
-- Prepared SQL queries for 'DataAircraft' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'data_aircraft'
--
SELECT registration, iata, icao, icao24 FROM data_aircraft WHERE 1=1;

--
-- INSERT template for table 'data_aircraft'
--
INSERT INTO data_aircraft (registration, iata, icao, icao24) VALUES (?, ?, ?, ?);

--
-- UPDATE template for table 'data_aircraft'
--
UPDATE data_aircraft SET registration = ?, iata = ?, icao = ?, icao24 = ? WHERE 1=2;

--
-- DELETE template for table 'data_aircraft'
--
DELETE FROM data_aircraft WHERE 1=2;

