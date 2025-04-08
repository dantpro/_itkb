#!/bin/sh

BKP_LST="/root/bkp/run/bkp-lst.lst"

BKP_DST_DIR="/root/bkp/dat"
BKP_SYNC_DIR="/mnt/bkp"

BKP_DB_DST_DIR="/root/bkp/dat/db"

#DB_FOR_BACKUP="wordpress drupal"
DB_FOR_BACKUP=""

BKP_TIME=`date +%y%m%d_%H%M%S`
HOST=`hostname`

KEEP_FILES=10

# with symlinks
# tar -cvhzp -T $BKP_LST -f $BKP_DST_DIR/$BKP_TIME[$HOST]dat.tgz
#
# no symlinks
# tar -cvzp -T $BKP_LST -f $BKP_DST_DIR/$BKP_TIME\_$HOST\_dat.tgz

# File list backup
#
grep -Ev '(#.*$)|(^$)' $BKP_LST |
	xargs tar -cvzp -f $BKP_DST_DIR/$BKP_TIME\_$HOST\_dat.tgz

# MySQL db backup
#
for DB in $DB_FOR_BACKUP
do
    mysqldump --user='root' --password='' $DB |gzip -c > $BKP_DB_DST_DIR/$BKP_TIME\_$HOST\_$DB.sql.gz
done

printf "\n\nDelete old files\n..."

find $BKP_DST_DIR/ -type f -name "*_*_*_dat.tgz"  -printf '%T@ "%p"\n' | \
	sort -n | \
	head -n -$KEEP_FILES | \
	awk '{print $2}' | \
	xargs -I {} rm {}

find $BKP_DB_DST_DIR/ -type f -name "*.sql.gz"  -printf '%T@ "%p"\n' | \
	sort -n | \
	head -n -$KEEP_FILES | \
	awk '{print $2}' | \
	xargs -I {} rm {}


printf "\n\nRsyncing backup dir to remote location\n...\n\n"
rsync -rlptDv --progress --delete $BKP_DST_DIR/ $BKP_SYNC_DIR

ls -l $BKP_DST_DIR/ $BKP_SYNC_DIR/

