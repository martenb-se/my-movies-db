-- Run with pgTAP: https://pgtap.org/
BEGIN;

SELECT plan(2);

-- Begin testing
PREPARE insert_tt10872600_SpiderManNoWayHome_DEFAULT_DEFAULT AS
    INSERT INTO movies (imdb_id, name)
        VALUES ('tt6320628-test', 'Spider-Man: Far from Home');
SELECT lives_ok(
   'insert_tt10872600_SpiderManNoWayHome_DEFAULT_DEFAULT',
   'can insert movie with default values for seen and rating'
);

PREPARE select_default_value_seen_rating_movies_imdbid_tt10872600 AS
    SELECT seen, rating FROM movies WHERE imdb_id='tt6320628-test';
SELECT results_eq(
    'select_default_value_seen_rating_movies_imdbid_tt10872600',
    $$VALUES (FALSE, 0) $$,
    'inserted movie with default value for seen should have it as false and rating should be 0'
);

-- Finish testing
SELECT * FROM finish();

ROLLBACK;