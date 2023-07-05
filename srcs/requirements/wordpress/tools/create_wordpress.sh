#!/bin/sh
sed -x
sleep 5
#check if wp-config.php exist
if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else

####### MANDATORY PART ##########

	#Download wordpress and all config file
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* /var/www/html
	rm -rf latest.tar.gz
	rm -rf wordpress
	chown -R www-data:www-data /var/www/
	chmod -R 755 /var/www/html/

	wp config create	--allow-root \
						--dbname=$SQL_DATABASE \
						--dbuser=$SQL_USER \
						--dbpass=$SQL_PASSWORD \
						--dbhost=$SQL_HOSTNAME --path='/var/www/html'

	wp core install		--url=$DOMAIN_NAME \
						--title=$SITE_TITLE \
						--admin_user=$SQL_USER \
						--admin_password=$SQL_PASSWORD \
						--admin_email=$ADMIN_EMAIL \
						--allow-root --path='/var/www/html'

	wp user create		--allow-root --role=author \
						$USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASS \
						--path='/var/www/html'

	wp plugin update --allow-root --all --path='/var/www/html'

	wp theme install inspiro --allow-root --activate --path='/var/www/html'
	#cp /var/tmp/wp-config.php wp-config.php
	#rm -rf wp-config-sample.php
	echo -e "wp is done"
fi

exec "$@"