#!/usr/bin/env bash

gcloud auth activate-service-account --key-file=$SERVICE_ACCOUNT_PATH
if [ $? == 1 ]
then
  echo "ERROR: Could not autheticate to Google Cloud. Did you provide the key file as secret?"
  exit 1
fi

if [[ $BUCKET_PATH == "" ]]
then
  echo "No bucket defined."
  exit 1
fi