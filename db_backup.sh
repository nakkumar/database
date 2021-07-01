#!/bin/bash
day=$(date +%Y_%m_%d)
#echo "$day"

mysqldump --single-transaction  -u root -pzippyops information_schema > information_schema-$day.sql
mysqldump --single-transaction  -u root -pzippyops mysql > mysql-$day.sql
mysqldump --single-transaction  -u root -pzippyops performance_schema > performance_schema-$day.sql
mysqldump --single-transaction  -u root -pzippyops zabbix > zabbix-$day.sql


##############################

#!/bin/bash
day=$(date +%Y_%m_%d)
#echo "$day"

#mysqldump --single-transaction  -u root -pzippyops information_schema > information_schema-$day.sql
#mysqldump --single-transaction  -u root -pzippyops mysql > mysql-$day.sql
#mysqldump --single-transaction  -u root -pzippyops performance_schema > performance_schema-$day.sql
#mysqldump --single-transaction  -u root -pzippyops zabbix > zabbix-$day.sql

mysqldump --single-transaction  -u root -pzippyops information_schema > /etc/zabbix/db_backup/information_schema_$day.sql
mysqldump --single-transaction  -u root -pzippyops mysql > /etc/zabbix/db_backup/mysql_$day.sql
mysqldump --single-transaction  -u root -pzippyops performance_schema > /etc/zabbix/db_backup/performance_schema_$day.sql
mysqldump --single-transaction  -u root -pzippyops zabbix > /etc/zabbix/db_backup/zabbix_$day.sql



tar cvf /etc/zabbix/db_backup/db_$day.tar /etc/zabbix/db_backup/*.sql


rm -rf /etc/zabbix/db_backup/*.sql


############


#!/bin/bash
day=$(date +%Y_%m_%d)
#echo "$day"

#mysqldump --single-transaction  -u root -pzippyops information_schema > information_schema-$day.sql
#mysqldump --single-transaction  -u root -pzippyops mysql > mysql-$day.sql
#mysqldump --single-transaction  -u root -pzippyops performance_schema > performance_schema-$day.sql
#mysqldump --single-transaction  -u root -pzippyops zabbix > zabbix-$day.sql

echo "Dbdump !!!!"

mysqldump --single-transaction  -u root -pzippyops information_schema > /etc/zabbix/db_backup/information_schema_$day.sql
mysqldump --single-transaction  -u root -pzippyops mysql > /etc/zabbix/db_backup/mysql_$day.sql
mysqldump --single-transaction  -u root -pzippyops performance_schema > /etc/zabbix/db_backup/performance_schema_$day.sql
mysqldump --single-transaction  -u root -pzippyops zabbix > /etc/zabbix/db_backup/zabbix_$day.sql

echo "compress !!!!"

#tar cvf /etc/zabbix/db_backup/db_$day.tar /etc/zabbix/db_backup/*.sql

sudo 7z a /etc/zabbix/db_backup/db_$day.zip  /etc/zabbix/db_backup/*.sql

sleep 3s

echo "mail send !!!!"

echo "This is a test message" | mail -s Test -a /etc/zabbix/db_backup/db_2021_07_01.zip  nakkumar1997@gmail.com

rm -rf /etc/zabbix/db_backup/*.sql

#########
