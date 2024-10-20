-- CREATE TABLE books in schema my_schema

CREATE TABLE IF NOT EXISTS my_schema.books (
                                 id SERIAL PRIMARY KEY,
                                 title VARCHAR(255) NOT NULL,
                                 author VARCHAR(255) NOT NULL,
                                 pages INTEGER NOT NULL,
                                 publisher VARCHAR(255)
);