-- delete/truncate records in table 'books'
BEGIN;

-- choose schema
SET search_path = my_schema;

-- insert the new records
TRUNCATE TABLE books;

-- cleanup
    reset all;

COMMIT ;