export $(cat /env | xargs)

if [ -d "/var/lib/mysql/" ]; then
    if [ "$(ls -A /var/lib/mysql/)" ]; then
        echo "Data already exists"
        DB_EXISTS='true'
    fi
fi

if [ -z "$DB_EXISTS" ]; then
    echo "Installing Database"
    mariadb-install-db\
        --datadir=/var/lib/mysql\
        --skip-test-db\
        --auth-root-authentication-method=normal\
        --default-time-zone=SYSTEM
    echo "Starting temporary server, to create DATABASE, USER, etc."
    mysqld &
    MYSQL_PID=$!
    sleep 5

    echo "Creating DATABASE and USER"
    mysql --host=localhost --user=root << EOF
CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
ALTER USER 'root'@localhost IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
GRANT ALL ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF

    echo "Loading prefilled data for wordpress"
    mysql --host=localhost --user=root "${MYSQL_DATABASE}" --password="${MYSQL_ROOT_PASSWORD}" < /initdb.sql

    sleep 1
    echo "Stopping temporary server"
    kill -15 $MYSQL_PID
fi

echo "Starting MariaDB"
mysqld --port=3306
