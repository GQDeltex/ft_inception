FROM alpine:3

RUN apk add --no-cache php php-fpm php-json php-mysqli

RUN adduser -u 82 -D -S -G www-data www-data && mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html

COPY ./www-fpm.conf /usr/etc/php-fpm.conf

WORKDIR /var/www/html

EXPOSE 9000

CMD ["/usr/sbin/php-fpm8", "-F", "-y=/usr/etc/php-fpm.conf"]
