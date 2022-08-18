-- Run with pgTAP: https://pgtap.org/
BEGIN;

SELECT plan(1);

-- Begin testing
PREPARE insert_NULL_SpiderManNoWayHome_true_10 AS
    INSERT INTO movies (imdb_id, name, seen, rating)
    VALUES (NULL, 'Spider-Man: No Way Home', TRUE, 10);
SELECT throws_ilike(
   'insert_NULL_SpiderManNoWayHome_true_10',
   'null value in column "imdb_id" of relation "movies" violates not-null constraint',
   'can not insert imdb id that is null'
);

-- Finish testing
SELECT * FROM finish();

ROLLBACK;