-- Run with pgTAP: https://pgtap.org/
BEGIN;

SELECT plan(1);

-- Begin testing
PREPARE insert_tt4154796_TOOLONG_true_10 AS
    INSERT INTO movies (imdb_id, name, seen, rating)
    VALUES ('tt4154796', REPEAT('x', 256), TRUE, 10);
SELECT throws_ilike(
   'insert_tt4154796_TOOLONG_true_10',
   'value too long for type character varying(255)',
   'can not insert name that is too long'
);

-- Finish testing
SELECT * FROM finish();

ROLLBACK;