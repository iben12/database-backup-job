#!/usr/bin/env bash

set -e

gcloud-auth

echo "Restoring volume"

cd /tmp

echo "Downloading tarball from GCS"
gsutil cp gs://$BUCKET_PATH/$FILE .

echo "Extracting files"
mkdir -p $TARGET_DIR
tar -xzf $FILE -C $TARGET_DIR --strip 1

if [[ $PERMISSIONS ]]
then
  echo "Setting permissions"
  chown -R $PERMISSIONS $TARGET_DIR
fi

ls -la $TARGET_DIR

echo "Done"