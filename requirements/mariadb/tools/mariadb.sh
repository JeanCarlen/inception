#!/bin/bash
set -x

mysql_install_db
/etc/init.d/mysql start

# envsubst < wordpress.sql | mysql -h localhost -u root

echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$SQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

#Create database and user in the database for wordpress

echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE; GRANT ALL ON $SQL_DATABASE.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -u root


# echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$SQL_ROOT_PASSWORD');"  | mysql -uroot
# echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD' WITH GRANT OPTION;" | mysql -uroot -proot123
# echo "DELETE FROM mysql.user WHERE user != 'root' AND user != 'mariadb.sys' OR (user = 'root' AND host != 'localhost');"  | mysql -uroot -proot123
# echo "CREATE DATABASE $SQL_NAME;"  | mysql -uroot -proot123
# echo "CREATE USER '$SQL_USER'@'%' IDENTIFIED by '$SQL_PASSWORD';"  | mysql -uroot -proot123
# echo "GRANT ALL PRIVILEGES ON $SQL_NAME.* TO $SQL_USER@'%';"  | mysql -uroot -proot123
# echo "FLUSH PRIVILEGES;"  | mysql -uroot -proot123

/etc/init.d/mysql stop

exec "$@"