DROP TABLE books;
DROP TABLE titles;
DROP TABLE authors;

CREATE TABLE authors
(
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE titles
(
  id SERIAL8 primary key,
  book_title VARCHAR(255)
);

CREATE TABLE books
(
  id SERIAL8 primary key,
  author_id INT8 references authors(id),
  title_id INT8 references titles(id)
);