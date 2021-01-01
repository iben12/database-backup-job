FROM jmaitrehenry/google-cloud-sdk

RUN apk add --no-cache mysql-client mongodb-tools

COPY backup.sh /usr/local/bin/backup
COPY gcloud-auth.sh /usr/local/bin/gcloud-auth
COPY mysql-backup.sh /usr/local/bin/mysql-backup
COPY mongo-backup.sh /usr/local/bin/mongo-backup
COPY restore-volume.sh /usr/local/bin/restore-volume

CMD [ "ls" ]