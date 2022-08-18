-- Run with pgTAP: https://pgtap.org/
BEGIN;

SELECT plan(1);

-- Begin testing
SELECT has_table('movies');

-- Finish testing
SELECT * FROM finish();

ROLLBACK;