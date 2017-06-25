CREATE TABLE employees (
   empid int not null,
   lastname varchar(30),
   firstname varchar(30),
   salary float,
   primary key (empid)
);
INSERT INTO employees VALUES (1, 'Blum', 'Rich', 25000.00);
INSERT INTO employees VALUES (2, 'Blum', 'Barbara', 45000.00);
INSERT INTO employees VALUES (3, 'Nadel', 'Kate Jane', 34500);
INSERT INTO employees VALUES (4, 'Taylor', 'Jessica', 52340);
