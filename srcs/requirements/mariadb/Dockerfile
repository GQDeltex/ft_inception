FROM alpine:3

RUN apk add --no-cache mariadb mariadb-client
RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld
RUN echo -e "[mysqld]\nskip-networking=0" >> /etc/my.cnf

EXPOSE 3306
VOLUME /var/lib/mysql
ENV MARIADB_PORT=3306
ENV MARIADB_USER=mariadb
ENV MARIADB_PASSWORD=mariadb
ENV MARIADB_DATABASE=mariadb

COPY ./entrypoint.sh /entrypoint.sh
USER mysql
CMD /entrypoint.sh
