-- Run with pgTAP: https://pgtap.org/
BEGIN;

SELECT plan(1);

-- Begin testing
PREPARE insert_tt4154796_AvengersEndgame_FALSE_10 AS
    INSERT INTO movies (imdb_id, name, seen, rating)
    VALUES ('tt4154796', 'Avengers: Endgame', FALSE, 10);
SELECT throws_ilike(
   'insert_tt4154796_AvengersEndgame_FALSE_10',
   'new row for relation "movies" violates check constraint "ck_movies_rating_range"',
   'can not give rating to movie that is not seen'
);

-- Finish testing
SELECT * FROM finish();

ROLLBACK;