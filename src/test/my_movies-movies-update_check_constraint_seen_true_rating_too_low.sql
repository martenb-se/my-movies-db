-- Run with pgTAP: https://pgtap.org/
BEGIN;

SELECT plan(1);

-- Begin testing
INSERT INTO movies (imdb_id, name)
        VALUES ('tt10872600-test', 'Spider-Man: No Way Home');
PREPARE update_tt10872600_set_seen_true_rating_0 AS
    UPDATE movies SET seen = true, rating = 0 WHERE imdb_id = 'tt10872600-test';
SELECT throws_ilike(
    'update_tt10872600_set_seen_true_rating_0',
    'new row for relation "movies" violates check constraint "ck_movies_rating_range"',
    'can not update entry with rating unless it has been seen'
);

-- Finish testing
SELECT * FROM finish();

ROLLBACK;