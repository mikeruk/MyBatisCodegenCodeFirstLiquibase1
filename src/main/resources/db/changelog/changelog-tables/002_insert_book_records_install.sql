-- insert two new book records in the table 'books'

-- choose schema
SET search_path = my_schema;

-- insert the new records
INSERT INTO books (title, author, pages, publisher)
VALUES ('The Enchanted River Chronicles', 'Alice Harper', 320, 'Mystic Tales Publishing'),
       ('Whispers of the Forgotten Realm', 'Johnathan Reed', 285, 'Realm Books Ltd.')

