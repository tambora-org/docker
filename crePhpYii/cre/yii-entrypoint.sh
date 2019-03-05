#!/usr/bin/env bash
set -e 

# /cre/php-entrypoint.sh # later maybe php-dev-entrypoint.sh

composer create-project --prefer-dist yiisoft/yii2-app-basic /cre/tmp/yii 

rsync -rl /cre/tmp/yii/ /cre/www/yii
# later use --exclude /dir1/ --exclude /dir2/
rm -rf /cre/tmp/yii

exec "$@"
