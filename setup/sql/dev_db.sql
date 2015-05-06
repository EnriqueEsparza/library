-- Postgres template for creating a new database

-- create db
CREATE DATABASE library;

-- psql - switch to new DB context
\connect library

-- create sample tables with auto index primary keys

CREATE TABLE IF NOT EXISTS book (
  id SERIAL PRIMARY KEY,
  title varchar,
  author_id int
);

CREATE TABLE IF NOT EXISTS book_copy (
  id SERIAL PRIMARY KEY,
  book_id int
);

CREATE TABLE IF NOT EXISTS checkedout (
  id SERIAL PRIMARY KEY,
  patron_id int,
  book_copy_id int,
  on_date date
);

CREATE TABLE IF NOT EXISTS patron (
  id SERIAL PRIMARY KEY,
  name varchar
);

CREATE TABLE IF NOT EXISTS author (
  id SERIAL PRIMARY KEY,
  name varchar
);

CREATE DATABASE library_test WITH TEMPLATE library;


/* Addtl. SQL syntax hints
DROP tables if restting for a dev/test environment
--DROP TABLE IF EXISTS table_1;

alternately, one possible method to clear tables for dev/test environment
--DELETE FROM table_1 WHERE id IS NOT NULL;

Insert test/sample data for dev/test
--INSERT INTO table_1 (text, number, date) VALUES ('test',4,'2015-03-03');
*/
