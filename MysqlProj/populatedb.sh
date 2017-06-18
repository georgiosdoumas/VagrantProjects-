#!/bin/bash
#This file creates a DB, 1 table, and populates it with rows and columns
# be sure to do a chmod +x on this file
MYSQL=$(which mysql)
$MYSQL -u root -e 'CREATE DATABASE personneldb'
$MYSQL personneldb -u root << EOF
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
EOF
echo "personneldb has been created and table employee has been populated" > /vagrant/dbcreated.lock
$MYSQL personneldb -u root -e 'SELECT * FROM employees' >> /vagrant/dbcreated.lock
exit
