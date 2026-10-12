--
-- "AviationStack"
-- Prepared SQL queries for 'DataFlight' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'data_flight'
--
SELECT flight_date, flight_status, departure, arrival, airline, flight, aircraft, live FROM data_flight WHERE 1=1;

--
-- INSERT template for table 'data_flight'
--
INSERT INTO data_flight (flight_date, flight_status, departure, arrival, airline, flight, aircraft, live) VALUES (?, ?, ?, ?, ?, ?, ?, ?);

--
-- UPDATE template for table 'data_flight'
--
UPDATE data_flight SET flight_date = ?, flight_status = ?, departure = ?, arrival = ?, airline = ?, flight = ?, aircraft = ?, live = ? WHERE 1=2;

--
-- DELETE template for table 'data_flight'
--
DELETE FROM data_flight WHERE 1=2;

