-- Postgres sample template for creating a new database

-- set psql var to new db name
\set db new_db

-- create db
CREATE DATABASE :db;

-- psql - switch to new DB context
\connect :db

-- create sample tables with auto index primary keys

CREATE TABLE IF NOT EXISTS table_1 (
  id SERIAL PRIMARY KEY,
  text varchar(32) DEFAULT NULL,
  number integer DEFAULT 0,
  date timestamp
);

CREATE TABLE IF NOT EXISTS table_2 (
  id SERIAL PRIMARY KEY,
  table1_id integer DEFAULT NULL,
  text varchar(32) DEFAULT NULL,
  number integer DEFAULT 0,
  date timestamp
);



/* Addtl. SQL syntax hints
DROP tables if restting for a dev/test environment
--DROP TABLE IF EXISTS table_1;

alternately, one possible method to clear tables for dev/test environment
--DELETE FROM table_1 WHERE id IS NOT NULL;

Insert test/sample data for dev/test
--INSERT INTO table_1 (text, number, date) VALUES ('test',4,'2015-03-03');
*/
