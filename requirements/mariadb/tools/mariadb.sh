#!/bin/sh

# Start the MySQL service
mysql_install_db
service mysql start

# Wait for MySQL to start
sleep 5

# Check if the database exists
if [ -d "/var/lib/mysql/$SQL_DATABASE" ]; then
    echo "Database already exists"
else
    # Create the database and user
    echo "Creating database..."
    echo "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};" | mysql -uroot -p'${SQL_ROOT_PASSWORD}'
    
    echo "Creating user..."
    echo "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';" | mysql -uroot -p'${SQL_ROOT_PASSWORD}'
    
    echo "Granting privileges..."
    echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}' WITH GRANT OPTION;" | mysql -uroot -p'${SQL_ROOT_PASSWORD}'
    echo "GRANT ALL PRIVILEGES ON ${SQL_HOSTNAME}.* TO '${SQL_USER}'@'%';" | mysql -uroot -p'${SQL_ROOT_PASSWORD}'
    
    echo "Flushing privileges..."
    echo "FLUSH PRIVILEGES;" | mysql -uroot -p'${SQL_ROOT_PASSWORD}'
    
    echo "Changing root user password..."
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';" | mysql -uroot -p'${SQL_ROOT_PASSWORD}'
    
    echo "Granting root privileges..."
    echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -uroot -p'${SQL_ROOT_PASSWORD}'
fi

echo "we are here"

# Stop the MySQL service
service mysql stop

exec "$@"
