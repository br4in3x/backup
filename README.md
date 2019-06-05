### Backup

This is Postgres and Files backup script. Backups are being uploaded to Amazon S3 bucket.

Example usage:

```bash
LOCAL_STORAGE=/home/backups \
FILES_DIR=/home/apps/your_cool_app \
S3_BUCKET_NAME=my-storage-bucket \
PG_DB=database-name \
PG_USER=pg-user \
PG_PASSWORD=qwerty123 \
sh backup.sh
```