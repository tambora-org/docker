#!/usr/bin/env bash
set -e 

# /cre/php-entrypoint.sh # later maybe php-dev-entrypoint.sh

mkdir -p /cre/tmp/cre-vue
cd /cre/tmp/cre-vue

## npm set init.author.email "example-user@example.com"
## npm set init.author.name "example_user"
## npm set init.license "MIT"

# https://docs.npmjs.com/creating-a-package-json-file#default-values-extracted-from-the-current-directory
npm init -y
npm install --save-dev vue vue-router

##rsync -r /cre/tmp/yii/ /cre/www/yii
# later use --exclude /dir1/ --exclude /dir2/
##rm -rf /cre/tmp/yii

##chmod -R 774 /cre/www/yii/web/assets 
##chown -R www-data:www-data /cre/www/yii/web/assets

exec "$@"
