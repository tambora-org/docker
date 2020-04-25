#!/usr/bin/env bash
set -e 

# call ? /cre/php-entrypoint.sh # later maybe php-dev-entrypoint.sh

# https://www.yiiframework.com/wiki/2547/draft-understanding-yii-3

##rsync -rl /cre/tmp/yii/ /cre/www/yii
rsync -r /cre/tmp/yii-demo/ /cre/www/yii
# later use --exclude /dir1/ --exclude /dir2/
##rm -rf /cre/tmp/yii

##chmod -R 774 /cre/www/yii/public/assets 
##chown -R www-data:www-data /cre/www/yii/public/assets

cd /cre/www/yii-demo && composer install && composer dump-autoload

exec "$@"

