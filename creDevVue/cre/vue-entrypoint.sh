#!/usr/bin/env bash
set -e 

# /cre/php-entrypoint.sh # later maybe php-dev-entrypoint.sh

mkdir -p /cre/dev/cre-vue
cd /cre/dev/cre-vue

## npm set init.author.email "example-user@example.com"
## npm set init.author.name "example_user"
## npm config set init.author.url http://iamsim.me/
## npm set init-version "${CRE_VERSION}.0"
npm set init.license "Apache-2.0"

# https://docs.npmjs.com/creating-a-package-json-file#default-values-extracted-from-the-current-directory
npm init -y
npm install -g npm-add-script # https://www.npmjs.com/package/npm-add-script
npm install --save-dev vue vue-router       #vue-vuex
npm install --save-dev webpack webpack-cli
npm install --save-dev vue-loader vue-template-compiler 
npm install --save-dev vue-style-loader css-loader stylus stylus-loader
npm install --save-dev webpack-dev-server html-webpack-plugin


npmAddScript -k dev -v "webpack-dev-server --config build/webpack.config.dev.js"


npm run dev


##rsync -r /cre/tmp/yii/ /cre/www/yii
# later use --exclude /dir1/ --exclude /dir2/
##rm -rf /cre/tmp/yii

##chmod -R 774 /cre/www/yii/web/assets 
##chown -R www-data:www-data /cre/www/yii/web/assets

exec "$@"
