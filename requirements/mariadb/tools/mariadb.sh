#!/bin/sh

mysql_install_db

/etc/init.d/mysql start

#Check if the database exists

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then 
	echo "Database already exists"
else
	echo "CREATE DATABASE IF NOT EXISTS '${SQL_DATABASE}';" | mysql -uroot
	echo "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED by '${SQL_PASSWORD}' ;" | mysql -uroot
	echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD '${SQL_ROOT_PASSWORD}';"| mysql -uroot
	echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}' WITH GRANT OPTION;" | mysql -uroot
	# echo "DELETE FROM mysql.user WHERE user != 'root' AND user != 'mariadb.sys' OR (user = 'root' AND host != 'localhost');"| mysql -uroot
	echo "GRANT ALL PRIVILEGES ON '${SQL_NAME}'.* TO '${SQL_USER}' @'%';"| mysql -uroot
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"| mysql -uroot
	echo "FLUSH PRIVILEGES;" | mysql -uroot

	#Import database in the mysql command line
	#mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress.sql

fi

/etc/init.d/mysql stop

exec "$@"