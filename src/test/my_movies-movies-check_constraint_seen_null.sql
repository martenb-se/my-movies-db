-- Run with pgTAP: https://pgtap.org/
BEGIN;

SELECT plan(1);

-- Begin testing
PREPARE insert_tt4154796_AvengersEndgame_NULL_10 AS
    INSERT INTO movies (imdb_id, name, seen, rating)
    VALUES ('tt4154796', 'Avengers: Endgame', NULL, 10);
SELECT throws_ilike(
   'insert_tt4154796_AvengersEndgame_NULL_10',
   'null value in column "seen" of relation "movies" violates not-null constraint',
   'can not insert seen that is null'
);

-- Finish testing
SELECT * FROM finish();

ROLLBACK;