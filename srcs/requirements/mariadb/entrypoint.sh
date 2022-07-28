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
    MARIADB_PID=$!
    sleep 5

    echo "Creating DATABASE and USER"
    mysql --host=localhost --user=root << EOF
CREATE DATABASE IF NOT EXISTS \`$MARIADB_DATABASE\`;
CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';
GRANT ALL ON \`$MARIADB_DATABASE\`.* TO '$MARIADB_USER'@'%';
FLUSH PRIVILEGES;
EOF

    sleep 5
    echo "Stopping temporary server"
    kill -15 $MARIADB_PID
fi


echo "Starting MariaDB"
mysqld --port="$MARIADB_PORT"
