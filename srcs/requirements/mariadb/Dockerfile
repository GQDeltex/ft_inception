FROM alpine:3

RUN apk add --no-cache mariadb mariadb-client
RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld/
RUN echo -e "[mysqld]\nskip-networking=0" >> /etc/my.cnf

EXPOSE 3306
VOLUME /var/lib/mysql/

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_DATABASE

COPY ./initdb.sql /initdb.sql
COPY ./entrypoint.sh /entrypoint.sh
RUN echo -e "MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD\nMYSQL_USER=$MYSQL_USER\nMYSQL_PASSWORD=$MYSQL_PASSWORD\nMYSQL_DATABASE=$MYSQL_DATABASE" > /env

USER mysql
CMD /entrypoint.sh
