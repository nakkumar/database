#!/bin/bash
day=$(date +%Y_%m_%d)
#echo "$day"

mysqldump --single-transaction  -u root -pzippyops information_schema > information_schema-$day.sql
mysqldump --single-transaction  -u root -pzippyops mysql > mysql-$day.sql
mysqldump --single-transaction  -u root -pzippyops performance_schema > performance_schema-$day.sql
mysqldump --single-transaction  -u root -pzippyops zabbix > zabbix-$day.sql
