DROP TABLE books;
DROP TABLE authors;

CREATE TABLE authors
(
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE books
(
  id SERIAL8 primary key,
  title VARCHAR(255),
  author_id INT8 references authors(id)
);