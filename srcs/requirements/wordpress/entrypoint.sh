#!/bin/sh

alias wp="$(which php) /usr/local/bin/wp"

echo "Adding wordpress"
wp core download

echo "Loading config file"
cat /wp-config.php > ./wp-config.php

echo "Installing Plugins"
wp plugin install redis-cache
wp plugin activate redis-cache
wp redis enable

echo "Starting php-fpm"
/usr/sbin/php-fpm8 -F -y=$1
