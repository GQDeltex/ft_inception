FROM alpine:3

RUN apk add --no-cache wget php php-fpm php-json php-mysqli php-curl php-dom php-exif php-fileinfo php-mbstring php-openssl php-xml php-zip php-opcache php-gd php8-pecl-imagick php-intl php-iconv php8-pecl-redis php8-ctype php8-phar
RUN adduser -u 82 -D -S -G www-data www-data && mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp
RUN chmod +rx /usr/local/bin/wp

ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_DATABASE

COPY ./www-fpm.conf /usr/etc/php-fpm.conf
COPY ./entrypoint.sh /entrypoint.sh
COPY ./wp-config.php /wp-config.php
RUN sed -i -e "s/{{ DB_NAME }}/$MYSQL_DATABASE/g" /wp-config.php && sed -i -e "s/{{ DB_USER }}/$MYSQL_USER/g" /wp-config.php && sed -i -e "s/{{ DB_PASSWORD }}/$MYSQL_PASSWORD/g" /wp-config.php

WORKDIR /var/www/html
EXPOSE 9000
VOLUME /var/www/html

USER www-data
CMD ["/entrypoint.sh", "/usr/etc/php-fpm.conf"]
