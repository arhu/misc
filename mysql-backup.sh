#!/usr/local/bin/bash
# mysql dumper with compression


DB_USER=""
DB_PASSWORD=""
DB_HOST=""
BACKUP_PATH=""

DIR_NAME=$(date +"%Y%m%d")
mkdir $BACKUP_PATH/$DIR_NAME
MAIN_PATH=$BACKUP_PATH/$DIR_NAME


databases=`mysql -u $DB_USER -p$DB_PASSWORD -h $DB_HOST -e "SHOW DATABASES;" | tr -d "| " | grep -v Database`

for db in $databases; do
    if [[ "$db" != "information_schema" ]] && [[ "$db" != "performance_schema" ]] && [[ "$db" != "mysql" ]] && [[ "$db" != _* ]] ; then
        mysqldump -u $DB_USER -p$DB_PASSWORD -h $DB_HOST --databases $db | gzip -c > $MAIN_PATH/$db.sql.gz
    fi
done
