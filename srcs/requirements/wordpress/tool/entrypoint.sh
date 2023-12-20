# wp core download --path=/var/www/thi-le.42.fr --locale=en_US --force

wp --allow-root --version

wp config create --dbname=wordpress --dbuser="$MYSQL_USER" \
	--dbpass="$MYSQL_PASSWORD" --dbhost=mariadb --force

wp --info

wp core is-installed || wp core install --url=thi-le.42.fr --title="Wordpress" --admin_user="$WP_ADMIN" \
	--admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN"@mail.org --skip-email

wp user create "$WP_USER" "$WP_USER"@mail.org --user_pass="$WP_USER_PASSWORD"

wp theme install inspiro --activate

exec php-fpm81 -F
