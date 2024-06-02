DROP TABLE IF EXISTS sample_schema.employee;
CREATE TABLE sample_schema.employee
(
    id INT(10) NOT NULL PRIMARY KEY,
    name VARCHAR(40)
);


INSERT INTO sample_schema.employee (id, name) VALUES (1, "Hayashi");
INSERT INTO sample_schema.employee (id, name) VALUES (2, "Hiyashi");
INSERT INTO sample_schema.employee (id, name) VALUES (3, "Huyashi");
INSERT INTO sample_schema.employee (id, name) VALUES (4, "Heyashi");
INSERT INTO sample_schema.employee (id, name) VALUES (5, "Hoyashi");
