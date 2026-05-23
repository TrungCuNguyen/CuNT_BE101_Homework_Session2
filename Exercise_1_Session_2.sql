CREATE DATABASE LibraryDB;

CREATE SCHEMA library;

CREATE TABLE library.Books
(
    book_id        SERIAL PRIMARY KEY,
    title          VARCHAR(100) NOT NULL,
    author         VARCHAR(50)  NOT NULL,
    published_year INT,
    price          NUMERIC(10, 2)
);

ALTER TABLE library.Books
    ADD COLUMN created_at DATE;

DROP TABLE library.Books;