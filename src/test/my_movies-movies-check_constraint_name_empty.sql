-- Run with pgTAP: https://pgtap.org/
BEGIN;

SELECT plan(1);

-- Begin testing
PREPARE insert_tt4154796_EMPTY_true_10 AS
    INSERT INTO movies (imdb_id, name, seen, rating)
    VALUES ('tt4154796', '', TRUE, 10);
SELECT throws_ilike(
   'insert_tt4154796_EMPTY_true_10',
   'new row for relation "movies" violates check constraint "ck_movie_name_not_empty"',
   'can not insert name that is empty'
);

-- Finish testing
SELECT * FROM finish();

ROLLBACK;