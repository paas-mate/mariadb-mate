# mysql_mate

## preset users

### exporter
```sql
CREATE USER 'exporter'@'%' IDENTIFIED BY 'export_pwd';
GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'exporter'@'%';
```

### nopwd
```sql
CREATE DATABASE IF NOT EXISTS nopwd_db DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_bin;
CREATE USER IF NOT EXISTS nopwd;
GRANT ALL ON nopwd_db.* to nopwd@'%';
```

### normal
```
CREATE DATABASE IF NOT EXISTS normal_db DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_bin;
CREATE USER IF NOT EXISTS normal identified by 'Mysql@123';
GRANT ALL ON normal_db.* to normal@'%';
```
