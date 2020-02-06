DROP TABLE IF EXISTS students;

CREATE TABLE students(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  age INT,
  house VARCHAR(255)
);
