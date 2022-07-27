mysql_install_db\
    --datadir=/var/lib/mysql\
    --skip-test-db\
    --auth-root-authentication-method=socket

mysqld --port="$MARIADB_PORT"
