SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$SQL_ROOT_PASSWORD');
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD' WITH GRANT OPTION;
DELETE FROM mysql.user WHERE user != 'root' AND user != 'mariadb.sys' OR (user = 'root' AND host != 'localhost');
CREATE DATABASE $SQL_NAME;
CREATE USER '$SQL_USER'@'%' IDENTIFIED by '$SQL_PASSWORD';
GRANT ALL PRIVILEGES ON $SQL_NAME.* TO $SQL_USER@'%';
FLUSH PRIVILEGES;