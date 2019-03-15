#!/usr/bin/env bash
set -e 

/cre/vue-entrypoint.sh

#mkdir -p /cre/dev/mobile-app # vue-native needs directory not existing yet
mkdir -p /cre/dev
cd /cre/dev

## npm set init.author.email "example-user@example.com"
## npm set init.author.name "example_user"
## npm config set init.author.url http://iamsim.me/
npm set init.version "${CRE_VERSION}.0"
npm set init.license "Apache-2.0"

# https://docs.npmjs.com/creating-a-package-json-file#default-values-extracted-from-the-current-directory
#npm init -y
##npm install -g npm-add-script # -g needed; https://www.npmjs.com/package/npm-add-script 
##npm install -g vue-template-compiler @vue/cli @vue/cli-service     # @ for 3.0 
##npm install -g --save-dev @vue/cli-plugin-babel @vue/cli-plugin-eslint

### MOVE tO DOckerfile
###npm install -g --unsafe expo-cli
###npm install -g react-native 
### ## npm install nodejs-mobile-react-native --save
###npm install -g react-native-cli
###npm install -g create-react-native-app 
###npm install -g vue-native-cli
### ## npm install -g yarn
### END MOVE

cd /cre/dev
rm -Rf mobile-app # make sure directory does not exist
#vue-native init mobile-app #interactive needs prompts, so use script with expect instead
/cre/vue-native-init.sh mobile-app mApp

cd /cre/dev/mobile-app
npm install --save

#npm i expo

## EXPO only...
# expo init --non-interactive --template bare-minimum --name creApp creApp works....
##expo init demoProject --template blank --workflow managed


##npm install --save-dev @vue/web-component-wrapper 
##npm install --save-dev vue vue-router       #vue-vuex
##npm install --save-dev webpack webpack-cli
##npm install --save-dev vue-loader vue-template-compiler 
##npm install --save-dev vue-style-loader css-loader stylus stylus-loader
##npm install --save-dev webpack-dev-server html-webpack-plugin copy-webpack-plugin
##npm install --save-dev @babel/core babel-loader @babel/preset-env  #js-ES5
# install static code-check
##npm install --save-dev eslint babel-eslint eslint-loader eslint-config-standard 
##npm install --save-dev eslint-plugin-standard eslint-plugin-import eslint-plugin-node eslint-plugin-promise eslint-plugin-vue

##npmAddScript -k "dev" -v "webpack-dev-server --config build/webpack.config.dev.js"
##npmAddScript -k "cre" -v "webpack --config build/webpack.config.dev.js"
##npmAddScript -k "eslint" -v "eslint --ext .js,.vue, src"

#npm run dev ## run in procfile


##rsync -r /cre/tmp/yii/ /cre/www/yii
# later use --exclude /dir1/ --exclude /dir2/
##rm -rf /cre/tmp/yii

##chmod -R 774 /cre/www/yii/web/assets 
##chown -R www-data:www-data /cre/www/yii/web/assets

exec "$@"
