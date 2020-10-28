#!/usr/bin/env bash

mongorestore --username $MONGO_INITDB_ROOT_USERNAME --password $MONGO_INITDB_ROOT_PASSWORD --archive=/dump/mongo.dump.gz --gzip