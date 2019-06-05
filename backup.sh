#!/bin/bash

DATE=`date '+%Y-%m-%d--%H:%M'`

LOCAL_DIR=$LOCAL_STORAGE/$DATE
FILES_DIR=$FILES_DIR
S3_BUCKET_NAME=$S3_BUCKET_NAME

PG_DB=$PG_DB
PG_USER=$PG_USER
PG_PASSWORD=$PG_PASSWORD

mkdir -p $LOCAL_DIR

# Leave only 5 last dirs
echo "Cleaning old backups..."
cd $LOCAL_STORAGE
ls -t | sed -e '1,5d' | xargs -d '\n' rm -rf

# Dump database
echo "Copying database..."
PGPASSWORD=$PG_DB pg_dump -U $PG_USER -F c $PG_DB > $LOCAL_DIR/$PG_DB.pgdump

# Zip files
echo "Copying files..."
zip -rT $LOCAL_DIR/files.zip $FILES_DIR \
	-x "$FILES_DIR/.git/*" > /dev/null

# Upload files
echo "Uploading to S3..."
aws s3 cp $LOCAL_DIR s3://$S3_BUCKET_NAME/$DATE/ --recursive

echo "Done."