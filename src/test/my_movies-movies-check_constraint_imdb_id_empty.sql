-- Run with pgTAP: https://pgtap.org/
BEGIN;

SELECT plan(1);

-- Begin testing
PREPARE insert_EMPTY_SpiderManNoWayHome_true_10 AS
    INSERT INTO movies (imdb_id, name, seen, rating)
    VALUES ('', 'Spider-Man: No Way Home', TRUE, 10);
SELECT throws_ilike(
   'insert_EMPTY_SpiderManNoWayHome_true_10',
   'new row for relation "movies" violates check constraint "ck_movie_imdb_id_not_empty"',
   'can not insert imdb id that is empty'
);

-- Finish testing
SELECT * FROM finish();

ROLLBACK;