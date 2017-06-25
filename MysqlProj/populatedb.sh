#!/bin/bash
#This file creates a DB, 1 table in the DB, and populates the table with rows and columns
SQLCMDS="/vagrant/populatedb.sql"
MYSQL=$(which mysql)
DATE=$(date) 
$MYSQL -u root -e 'CREATE DATABASE personneldb'
if [ $? -eq 0 ] ; then 
  echo "personneldb has been created at $DATE " > /vagrant/dbcreated.lock
else 
  echo "creation of personneldb failed at $DATE " > /vagrant/dbcreated.lock
  exit
fi  
$MYSQL  -u root personneldb < $SQLCMDS
if [ $? -eq 0 ] ; then
  echo "table employee has been created and populated" >> /vagrant/dbcreated.lock
else 
  echo "creation and population of table employee failed" >> /vagrant/dbcreated.lock
  exit
fi
$MYSQL personneldb -u root -e 'SELECT * FROM employees' >> /vagrant/dbcreated.lock
exit
