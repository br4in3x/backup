### Backup

This is Postgres and Files backup script. Backups are being uploaded to Amazon S3 bucket. It will only leave 5 most recent copies on your local machine.

#### Usage:

```bash
LOCAL_STORAGE=/home/backups \
FILES_DIR=/home/apps/your_cool_app \
S3_BUCKET_NAME=my-storage-bucket \
PG_DB=database-name \
PG_USER=pg-user \
PG_PASSWORD=qwerty123 \
sh backup.sh
```