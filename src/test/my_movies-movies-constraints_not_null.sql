-- Run with pgTAP: https://pgtap.org/
BEGIN;

SELECT plan(5);

-- Begin testing
SELECT col_not_null('movies', 'id');
SELECT col_not_null('movies', 'imdb_id');
SELECT col_not_null('movies', 'name');
SELECT col_not_null('movies', 'seen');
SELECT col_not_null('movies', 'rating');

-- Finish testing
SELECT * FROM finish();

ROLLBACK;