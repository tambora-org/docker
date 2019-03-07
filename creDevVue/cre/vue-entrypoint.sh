#!/usr/bin/env bash
set -e 

# /cre/php-entrypoint.sh # later maybe php-dev-entrypoint.sh

#composer create-project --prefer-dist yiisoft/yii2-app-basic /cre/tmp/yii 
mkdir /cre/tmp/vue
cd /cre/tmp/vue
npm init
npm install --save-dev vue vue-router


##rsync -r /cre/tmp/yii/ /cre/www/yii
# later use --exclude /dir1/ --exclude /dir2/
##rm -rf /cre/tmp/yii

##chmod -R 774 /cre/www/yii/web/assets 
##chown -R www-data:www-data /cre/www/yii/web/assets

exec "$@"
