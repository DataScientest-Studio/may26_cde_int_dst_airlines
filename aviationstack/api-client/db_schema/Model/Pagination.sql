--
-- "AviationStack"
-- Prepared SQL queries for 'Pagination' definition.
-- Created using 'openapi-generator' ('postgresql-schema' generator)
-- (https://openapi-generator.tech/docs/generators/postgresql-schema)
--


--
-- SELECT template for table 'pagination'
--
SELECT "limit", "offset", "count", total FROM pagination WHERE 1=1;

--
-- INSERT template for table 'pagination'
--
INSERT INTO pagination ("limit", "offset", "count", total) VALUES (?, ?, ?, ?);

--
-- UPDATE template for table 'pagination'
--
UPDATE pagination SET "limit" = ?, "offset" = ?, "count" = ?, total = ? WHERE 1=2;

--
-- DELETE template for table 'pagination'
--
DELETE FROM pagination WHERE 1=2;

