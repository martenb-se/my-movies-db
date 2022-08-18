-- Run with pgTAP: https://pgtap.org/
BEGIN;

SELECT plan(1);

-- Begin testing
PREPARE insert_tt4154796_AvengersEndgame_true_NULL AS
    INSERT INTO movies (imdb_id, name, seen, rating)
    VALUES ('tt4154796', 'Avengers: Endgame', TRUE, NULL);
SELECT throws_ilike(
   'insert_tt4154796_AvengersEndgame_true_NULL',
   'null value in column "rating" of relation "movies" violates not-null constraint',
   'can not insert rating that is null when movie is seen'
);

-- Finish testing
SELECT * FROM finish();

ROLLBACK;