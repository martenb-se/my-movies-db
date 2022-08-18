-- Run with pgTAP: https://pgtap.org/
BEGIN;

SELECT plan(1);

-- Begin testing
PREPARE insert_TOOLONG_SpiderManNoWayHome_true_10 AS
    INSERT INTO movies (imdb_id, name, seen, rating)
    VALUES ('tt99999999999999999999999999999', 'Spider-Man: No Way Home', TRUE, 10);
SELECT throws_ilike(
   'insert_TOOLONG_SpiderManNoWayHome_true_10',
   'value too long for type character varying(20)',
   'can not insert imdb id that is too long'
);

-- Finish testing
SELECT * FROM finish();

ROLLBACK;