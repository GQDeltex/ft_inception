FROM alpine:3

RUN apk add --no-cache php php-fpm php-mysqli php8-session && adduser -u 82 -D -S -G www-data www-data && mkdir -p /var/www/html/adminer
ADD https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php /var/www/html/adminer/index.php
RUN chown -R www-data:www-data /var/www/html

COPY ./www-fpm.conf /usr/etc/php-fpm.conf

WORKDIR /var/www/html
EXPOSE 9000

USER www-data
CMD ["/usr/sbin/php-fpm8", "-F", "-y=/usr/etc/php-fpm.conf"]
