-- Run with pgTAP: https://pgtap.org/
BEGIN;

SELECT plan(1);

-- Begin testing
PREPARE insert_tt4154796_NULL_true_10 AS
    INSERT INTO movies (imdb_id, name, seen, rating)
    VALUES ('tt4154796', NULL, TRUE, 10);
SELECT throws_ilike(
   'insert_tt4154796_NULL_true_10',
   'null value in column "name" of relation "movies" violates not-null constraint',
   'can not insert name that is null'
);

-- Finish testing
SELECT * FROM finish();

ROLLBACK;