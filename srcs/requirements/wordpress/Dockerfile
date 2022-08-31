FROM alpine:3

RUN apk add --no-cache php php-fpm php-json php-mysqli wget

RUN adduser -u 82 -D -S -G www-data www-data && mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html

COPY ./www-fpm.conf /usr/etc/php-fpm.conf
COPY ./entrypoint.sh /entrypoint.sh
COPY ./wp-config.php /wp-config.php

WORKDIR /var/www/html

EXPOSE 9000

USER www-data

CMD ["/entrypoint.sh", "/usr/etc/php-fpm.conf"]
