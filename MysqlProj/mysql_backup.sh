#!/bin/bash
# This script uses rsync to take a daily backup of the folder /var/lib/mysql , 
# where the databases of mysql are located on the mysqlsrv box.
# It will be executed through a root cronjob on the back-srv 
MYSQLIP="192.168.10.120"
rsync -ra root@${MYSQLIP}:/var/lib/mysql/ /var/lib/mysql/ 
