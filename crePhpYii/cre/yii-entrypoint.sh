#!/usr/bin/env bash
set -e 

# /cre/php-entrypoint.sh # later maybe php-dev-entrypoint.sh

composer global require --prefer-stable --update-with-all-dependencies fxp/composer-asset-plugin

composer create-project --prefer-dist --no-install yiisoft/yii2-app-basic /cre/tmp/yii 
echo "Yii2: project created"
cd /cre/tmp/yii
composer config minimum-stability dev
composer config prefer-stable true

if [ -d /cre/php/packages/vendor ]; then
  echo "Yii2: Use local (cached) repository"
  composer config repositories.cre  '{"type": "path", "url": "/cre/php/packages/vendor/*/*"}' 
#  composer config repo.packagist false 
else
  echo "Yii2: Use web repository"
  composer config repositories.npm '{"type": "composer", "url": "https://asset-packagist.org"}'
fi

 echo "pck: $(ls -l /cre/php/packages/vendor)"
 echo "pck2 $(cat /cre/php/packages/composer.json)"
 echo "Current dir: $(pwd)" 
 echo "Cja: $(cat /cre/tmp/yii/composer.json)" 
 echo "Cjr: $(cat ./composer.json)"
 echo "Pja: $(cat /cre/tmp/yii/package.json)" 
 echo "Pjr: $(cat ./package.json)"
 echo "ht1: $(ls -l /cre/php/packages/vendor/ezyang)"
 echo "ht2: $(ls -l /cre/php/packages/vendor/ezyang/htmlpurifier)"
 echo "ht3 $(cat /cre/php/packages/vendor/ezyang/htmlpurifier/composer.json)"


composer install
echo "Yii2: project installed"

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


