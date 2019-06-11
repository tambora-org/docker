#!/usr/bin/env bash
set -e 

# call ? /cre/php-entrypoint.sh # later maybe php-dev-entrypoint.sh

# https://www.yiiframework.com/wiki/2547/draft-understanding-yii-3
composer create-project --prefer-dist --stability=dev yiisoft/yii-project-template /cre/tmp/yii
cd /cre/tmp/yii

RUN composer config minimum-stability dev
RUN composer config prefer-stable true
#RUN composer config repositories path /cre/php/packages 
#RUN composer config repositories.cre {"type:" "path", "url:" "/cre/php/packages"} 
RUN composer config repositories.cre {"type:" "path", "url:" "/cre/tmp/php/packages"} 
RUN composer config repositories.npm '{"type": "composer", "url": "https://asset-packagist.org"}'


composer require "foxy/foxy:^1.0.0"
composer require yiisoft/yii-base-web

##rsync -rl /cre/tmp/yii/ /cre/www/yii
rsync -r /cre/tmp/yii/ /cre/www/yii
# later use --exclude /dir1/ --exclude /dir2/
##rm -rf /cre/tmp/yii

##chmod -R 774 /cre/www/yii/web/assets 
##chown -R www-data:www-data /cre/www/yii/web/assets

exec "$@"
