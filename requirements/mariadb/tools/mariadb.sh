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
    echo "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};" | mysql
    echo "Creating user..."
    echo "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';" | mysql
    
    echo "Granting privileges..."
    echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'root123' WITH GRANT OPTION;" | mysqL
    echo "GRANT ALL PRIVILEGES ON ${SQL_HOSTNAME}.* TO '${SQL_USER}'@'%';" | mysql
    
    echo "Flushing privileges..."
    echo "FLUSH PRIVILEGES;" | mysql
    
    echo "Changing root user password..."
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root123';" | mysql
    
    echo "Granting root privileges..."
    echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql
# fi

# if [ -d "/tmp/.setup" ]; then
#     echo "Database already exists"
# else
# /usr/bin/mysql_secure_installation << _EOF_

# Y
# root123
# root123
# Y
# n
# Y
# Y
# _EOF_
# touch

fi

echo "we are here"

# Stop the MySQL service
service mysql stop

exec "$@"

