#!/usr/bin/env bash

set -e

echo "Backing up MongoDB data"
timestamp=`date +%Y-%m-%d_%H-%M`

mongodump --host $MONGODB_HOST --username $MONGO_USERNAME --password $MONGO_PASSWORD \
 --authenticationDatabase admin \
 --forceTableScan \
 --gzip --archive=mongo_backup.$timestamp.dump.gz

echo "Uploading dump to GCS"
gsutil cp mongo_backup.$timestamp.dump.gz gs://$BUCKET_PATH

echo "SUCCESS: MongoDB backed up"