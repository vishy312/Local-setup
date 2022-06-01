UPDATE mysql.user SET Password=PASSWORD('$DATABASE_PASS') WHERE User='root';

DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

DELETE FROM mysql.user WHERE User='';

DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';

FLUSH PRIVILEGES;

create database accounts;

grant all privileges on accounts.* TO 'admin'@'localhost' identified by 'admin123';

grant all privileges on accounts.* TO 'admin'@'%' identified by 'admin123';

accounts < /tmp/vprofile-project/src/main/resources/db_backup.sql;

FLUSH PRIVILEGES;