FROM alpine:3

RUN apk add --no-cache php php-fpm php-json php-mysqli

COPY ./www-fpm.conf /etc/php8/php-fpm.d/www-fpm.conf

EXPOSE 9000

CMD ["/usr/sbin/php-fpm8", "-F", "-R"]
