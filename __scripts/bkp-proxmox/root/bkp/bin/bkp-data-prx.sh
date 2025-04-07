#!/bin/sh

BKP_LST="/root/bkp/bin/bkp-data-prx.lst"
BKP_DST_DIR="/root/bkp/dat"
BKP_SYNC_DIR="/mnt/bkpn/$(hostname)"
BKP_DB_DST_DIR="/root/bkp/dat/db"

BKP_TIME=`date +%y%m%d_%H%M%S`

HOST=`hostname`

KEEP_FILES=10

mount /mnt/bkpn

# with symlinks
#tar -cvhzp -T $BKP_LST -f $BKP_DST_DIR/$BKP_TIME\_$HOST\_data.tgz

# no symlinks
tar -cvzp -T $BKP_LST -f $BKP_DST_DIR/$BKP_TIME\_$HOST\_data.tgz

# DB Backup
sqlite3 /var/lib/pve-cluster/config.db .dump |gzip -c > $BKP_DB_DST_DIR/config\_db\_dump\_$BKP_TIME.sql.gz

printf "\n\nDelete old files\n..."

find $BKP_DST_DIR/ -type f -name "*_*_*_data.tgz"  -printf '%T@ "%p"\n' | \
	sort -n | \
	head -n -$KEEP_FILES | \
	awk '{print $2}' | \
	xargs -I {} rm {}

find $BKP_DB_DST_DIR/ -type f -name "config_db_dump_*.sql.gz"  -printf '%T@ "%p"\n' | \
	sort -n | \
	head -n -$KEEP_FILES | \
	awk '{print $2}' | \
	xargs -I {} rm {}

printf "\n\nRsyncing backup dir to remote location\n...\n\n"

rsync -rlptDv --progress --delete $BKP_DST_DIR/ $BKP_SYNC_DIR

printf "\n\n"

ls -l $BKP_DST_DIR/ $BKP_SYNC_DIR/

umount /mnt/bkpn

