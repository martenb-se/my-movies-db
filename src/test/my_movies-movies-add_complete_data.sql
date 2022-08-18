-- Run with pgTAP: https://pgtap.org/
BEGIN;

SELECT plan(1);

-- Begin testing
PREPARE insert_tt10872600_SpiderManNoWayHome_true_10 AS
    INSERT INTO movies (imdb_id, name, seen, rating)
        VALUES ('tt10872600-test', 'Spider-Man: No Way Home', TRUE, 10);
SELECT lives_ok(
   'insert_tt10872600_SpiderManNoWayHome_true_10',
   'can insert movie with all attributes'
);

-- Finish testing
SELECT * FROM finish();

ROLLBACK;