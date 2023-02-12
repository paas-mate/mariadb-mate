#!/bin/bash

mkdir -p $MARIADB_HOME/logs
rm -rf /etc/mysql/my.cnf.fallback
rm -rf /etc/mysql/mysql.cnf
rm -rf /etc/mysql/my.cnf
rm -rf /etc/mysql/conf.d
rm -rf /etc/mysql/mysql.conf.d
CONF_FILE=/etc/mysql/my.cnf
echo "[mysqld]" >$CONF_FILE
echo "bind-address = 0.0.0.0" >>$CONF_FILE
echo "mysqlx-bind-address = 0.0.0.0" >>$CONF_FILE
echo "key_buffer_size  = 16M" >>$CONF_FILE
echo "myisam-recover-options  = BACKUP" >>$CONF_FILE
echo "log_error = $MARIADB_HOME/logs/mysql_error.log" >>$CONF_FILE
echo "max_binlog_size   = 100M" >>$CONF_FILE
echo "ssl = 0" >>$CONF_FILE
echo "[mysqldump]" >>$CONF_FILE
echo "quick" >>$CONF_FILE
echo "quote-names" >>$CONF_FILE
echo "max_allowed_packet = 16M" >> $CONF_FILE

mysqld --daemonize --user=root

mysql -u root < $MARIADB_HOME/mate/sql/init.sql
