#!/usr/bin/env bash
set -e 

rsync -rl /cre/tmp/yii/ /cre/www/yii
# later use --exclude /dir1/ --exclude /dir2/
rm -rf /cre/tmp/yii

exec "$@"
