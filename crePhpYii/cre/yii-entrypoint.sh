#!/usr/bin/env bash
set -e 

# /cre/php-entrypoint.sh # later maybe php-dev-entrypoint.sh

composer create-project --prefer-dist yiisoft/yii2-app-basic /cre/tmp/yii 
cd /cre/tmp/yii
composer config minimum-stability dev
composer config prefer-stable true
if [ -d /cre/tmp/php/packages ]; then
  composer config repositories.cre  '{"type": "path", "url": "/cre/tmp/php/packages"}' 
fi
composer config repositories.npm '{"type": "composer", "url": "https://asset-packagist.org"}'
composer config repo.packagist false
composer install

##rsync -rl /cre/tmp/yii/ /cre/www/yii
rsync -r /cre/tmp/yii/ /cre/www/yii
# later use --exclude /dir1/ --exclude /dir2/
##rm -rf /cre/tmp/yii

chmod -R 774 /cre/www/yii/web/assets 
chown -R www-data:www-data /cre/www/yii/web/assets

chmod -R 774 /cre/www/yii/runtime
chown -R www-data:www-data /cre/www/yii/runtime

#mkdir -p /cre/www/yii/data
#chmod -R 774 /cre/www/yii/data
#chown -R www-data:www-data /cre/www/yii/data

exec "$@"


