#!/usr/bin/env bash
set -e 

# call ? /cre/php-entrypoint.sh # later maybe php-dev-entrypoint.sh

# https://www.yiiframework.com/wiki/2547/draft-understanding-yii-3

composer create-project --prefer-dist --stability=dev --no-install yiisoft/yii-project-template /cre/tmp/yii
#instead: git clone, composer config repositories path /cre/..., composer install


cd /cre/tmp/yii
composer config minimum-stability dev
composer config prefer-stable true
composer config repositories.cre  '{"type:" "path", "url:" "/cre/php/packages"}' 
composer config repositories.npm '{"type": "composer", "url": "https://asset-packagist.org"}'
composer require "foxy/foxy:^1.0.0"
composer require php-extended/php-http-message-factory-psr17

composer require yiisoft/log
composer require yiisoft/cache
composer require yiisoft/di
composer require yiisoft/rbac
composer require yiisoft/view   
composer require yiisoft/db
composer require yiisoft/mutex
composer require yiisoft/active-record
composer require nyholm/psr7
composer require psr/http-factory
composer require psr/http-factory-implementation

composer require yiisoft/yii-web

composer require yiisoft/yii-base-web

echo "pck: $(ls -l /cre/php/packages/vendor)"
echo "pck2 $(cat /cre/php/packages/composer.json)"

composer install

##rsync -rl /cre/tmp/yii/ /cre/www/yii
rsync -r /cre/tmp/yii/ /cre/www/yii
# later use --exclude /dir1/ --exclude /dir2/
##rm -rf /cre/tmp/yii

##chmod -R 774 /cre/www/yii/web/assets 
##chown -R www-data:www-data /cre/www/yii/web/assets

exec "$@"

