#!/usr/bin/env bash

set -e

echo "Backing up MYSQL data"

if [ ! -z "$MYSQL_DATABASES" ];then 
  mysqldump -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD --single-transaction --databases $MYSQL_DATABASES > db.sql
  mysqldump -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD --system=users > users.sql
fi

echo "Compressing backup data..."
timestamp=`date +%Y-%m-%d_%H-%M`
tar -czf mysql_backup.$timestamp.tar.gz *.sql # 2>&1 > /dev/null
echo "Uploading tarball to GCS"
gsutil cp mysql_backup.$timestamp.tar.gz gs://$BUCKET_PATH

echo "SUCCESS: MYSQL backed up"
