-- Run with pgTAP: https://pgtap.org/
BEGIN;

SELECT plan(1);

-- Begin testing
PREPARE insert_tt4154796_AvengersEndgame_true_TOOHIGH AS
    INSERT INTO movies (imdb_id, name, seen, rating)
    VALUES ('tt4154796', 'Avengers: Endgame', TRUE, 11);
SELECT throws_ilike(
   'insert_tt4154796_AvengersEndgame_true_TOOHIGH',
   'new row for relation "movies" violates check constraint "ck_movies_rating_range"',
   'can not insert rating that is too high'
);

-- Finish testing
SELECT * FROM finish();

ROLLBACK;