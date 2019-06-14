#!/usr/bin/env bash
set -e 

##rsync -rl /cre/tmp/yii/ /cre/www/yii
rsync -r /cre/tmp/php/packages/ /cre/php/packages
# later use --exclude /dir1/ --exclude /dir2/
touch /cre/php/packages/ready.txt

exec "$@"


