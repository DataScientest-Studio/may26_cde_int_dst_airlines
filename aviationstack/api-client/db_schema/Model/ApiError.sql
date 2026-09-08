--
-- "AviationStack"
-- Prepared SQL queries for 'ApiError' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'api_error'
--
SELECT success, "error" FROM api_error WHERE 1=1;

--
-- INSERT template for table 'api_error'
--
INSERT INTO api_error (success, "error") VALUES (?, ?);

--
-- UPDATE template for table 'api_error'
--
UPDATE api_error SET success = ?, "error" = ? WHERE 1=2;

--
-- DELETE template for table 'api_error'
--
DELETE FROM api_error WHERE 1=2;

