#!/bin/bash

mkdir -p $MARIADB_HOME/logs
rm -rf /etc/mysql/my.cnf
rm -rf /etc/mysql/my.cnf.fallback
rm -rf /etc/mysql/mariadb.cnf
rm -rf /etc/mysql/conf.d
rm -rf /etc/mysql/mysql.conf.d
CONF_FILE=/etc/mysql/my.cnf
echo "[mysqld]" >$CONF_FILE
echo "pid-file = /opt/mariadb/mariadb.pid" >>$CONF_FILE
echo "socket = /opt/mariadb/mariadb.sock" >>$CONF_FILE
echo "bind-address = 0.0.0.0" >>$CONF_FILE
echo "character-set-server  = utf8mb4" >>$CONF_FILE
echo "collation-server      = utf8mb4_general_ci" >>$CONF_FILE
echo "log_error = $MARIADB_HOME/logs/mariadb_error.log" >>$CONF_FILE
echo "max_binlog_size   = 100M" >>$CONF_FILE
echo "ssl = 0" >>$CONF_FILE
echo "[client]" >>$CONF_FILE
echo "socket = /opt/mariadb/mariadb.sock" >>$CONF_FILE
echo "[mysqldump]" >>$CONF_FILE
echo "quick" >>$CONF_FILE
echo "quote-names" >>$CONF_FILE
echo "max_allowed_packet = 16M" >> $CONF_FILE

nohup mysqld --user=root >>$MARIADB_HOME/logs/mariadb.stdout.log 2>>$MARIADB_HOME/logs/mariadb.stderr.log &

sleep 3

mysql -u root < $MARIADB_HOME/mate/sql/init.sql
