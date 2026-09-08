--
-- "AviationStack"
-- Prepared SQL queries for 'FlightsFuture' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'flights_future'
--
SELECT pagination, "data" FROM flights_future WHERE 1=1;

--
-- INSERT template for table 'flights_future'
--
INSERT INTO flights_future (pagination, "data") VALUES (?, ?);

--
-- UPDATE template for table 'flights_future'
--
UPDATE flights_future SET pagination = ?, "data" = ? WHERE 1=2;

--
-- DELETE template for table 'flights_future'
--
DELETE FROM flights_future WHERE 1=2;

