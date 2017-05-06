DROP TABLE books;
DROP TABLE authors;

CREATE TABLE authors
(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE books
(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  quantity INT4,
  author_id INT4 REFERENCES authors(id) ON DELETE CASCADE
);