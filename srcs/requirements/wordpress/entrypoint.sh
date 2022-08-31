#!/bin/sh
echo "Downloading wordpress archive"
wget https://wordpress.org/latest.zip latest.zip
echo "Deflating Wordpress archive"
unzip latest.zip
rm latest.zip
echo "Moving to correct folder"
mv ./wordpress/* ./
rm -r wordpress
echo "Loading config file"
cat /wp-config.php > ./wp-config.php

echo "Starting php-fpm"
/usr/sbin/php-fpm8 -F -y=$1
