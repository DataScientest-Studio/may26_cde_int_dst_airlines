--
-- "AviationStack"
-- Prepared SQL queries for 'ApiError_error' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'api_error_error'
--
SELECT code, "type", info FROM api_error_error WHERE 1=1;

--
-- INSERT template for table 'api_error_error'
--
INSERT INTO api_error_error (code, "type", info) VALUES (?, ?, ?);

--
-- UPDATE template for table 'api_error_error'
--
UPDATE api_error_error SET code = ?, "type" = ?, info = ? WHERE 1=2;

--
-- DELETE template for table 'api_error_error'
--
DELETE FROM api_error_error WHERE 1=2;

