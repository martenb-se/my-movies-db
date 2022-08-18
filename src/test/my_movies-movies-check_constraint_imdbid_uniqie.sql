-- Run with pgTAP: https://pgtap.org/
BEGIN;

SELECT plan(1);

-- Begin testing
INSERT INTO movies (imdb_id, name, seen, rating)
        VALUES ('tt10872600-test', 'Spider-Man: No Way Home', TRUE, 10);
PREPARE insert_tt10872600_SpiderManNoWayHome_true_10_DUPLICATE AS
    INSERT INTO movies (imdb_id, name, seen, rating)
    VALUES ('tt10872600-test', 'Spider-Man: No Way Home 2', TRUE, 10);
SELECT throws_ilike(
    'insert_tt10872600_SpiderManNoWayHome_true_10_DUPLICATE',
    'duplicate key value violates unique constraint "movies_imdb_id_uindex"',
    'can not insert movie with the same imdb id twice'
);

-- Finish testing
SELECT * FROM finish();

ROLLBACK;