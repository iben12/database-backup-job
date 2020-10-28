#!/usr/bin/env bash

set -e

echo "Backing up MYSQL data"

mysqldump -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD --single-transaction --all-databases > db.sql

echo "Compressing backup data..."
timestamp=`date +%Y-%m-%d_%H-%M`
tar -czf mysql_backup.$timestamp.tar.gz db.sql 2>&1 > /dev/null
echo "Uploading tarball to GCS"
gsutil cp mysql_backup.$timestamp.tar.gz gs://$BUCKET_PATH

echo "SUCCESS: MYSQL backed up"