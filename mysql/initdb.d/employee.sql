DROP SCHEMA IF EXISTS sample;
CREATE SCHEMA sample;
USE sample;

DROP TABLE IF EXISTS employee;

CREATE TABLE employee
(
  id           INT(10),
  name     VARCHAR(40)
);

INSERT INTO employee (id, name) VALUES (1, "Hayashi");
INSERT INTO employee (id, name) VALUES (2, "Hiyashi");
INSERT INTO employee (id, name) VALUES (3, "Huyashi");
INSERT INTO employee (id, name) VALUES (4, "Heyashi");
INSERT INTO employee (id, name) VALUES (5, "Hoyashi");
