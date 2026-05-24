CREATE TABLE library_2.Members
(
    member_id     SERIAL PRIMARY KEY,
    member_name   VARCHAR(50) NOT NULL,
    email         VARCHAR(50) NOT NULL UNIQUE,
    phone         VARCHAR(11) UNIQUE,
    date_of_birth DATE,
    address       VARCHAR(100),
    status        VARCHAR(20) NOT NULL CHECK (status IN ('ACTIVE', 'INACTIVE')),
    join_date     DATE        NOT NULL
);

CREATE TABLE library_2.Categories
(
    category_id   SERIAL PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL,
    description   TEXT
);

CREATE TABLE library_2.Books
(
    book_id             SERIAL PRIMARY KEY,
    ISBN                VARCHAR(20) UNIQUE,
    title               VARCHAR(50) NOT NULL,
    publish_year        INT CHECK (publish_year BETWEEN 1900 AND 2500),
    publisher           VARCHAR(100),
    total_of_copies     BIGINT      NOT NULL,
    available_of_copies BIGINT      NOT NULL,
    category_id         INT REFERENCES library_2.Categories (category_id)
);

CREATE TABLE library_2.Authors
(
    author_id        SERIAL PRIMARY KEY,
    author_name      VARCHAR(50) NOT NULL,
    author_biography TEXT
);

CREATE TABLE library_2.BookAuthors
(
    book_author_id SERIAL PRIMARY KEY,
    book_id        INT REFERENCES library_2.Books (book_id),
    author_id      INT REFERENCES library_2.Authors (author_id)
);

CREATE TABLE library_2.BookLoans
(
    book_loan_id  SERIAL PRIMARY KEY,
    loan_date     DATE,
    loan_deadline DATE,
    return_date   DATE,
    member_id     INT REFERENCES library_2.Members (member_id)
);

CREATE TABLE library_2.BookLoansDetail
(
    book_loan_detail_id SERIAL PRIMARY KEY,
    quantity            INT,
    book_id             INT REFERENCES library_2.Books (book_id),
    book_loan_id        INT REFERENCES library_2.BookLoans (book_loan_id)
);