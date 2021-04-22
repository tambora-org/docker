#!/usr/bin/env bash
set -e 

## /cre/vue-entrypoint.sh ## needed?

#mkdir -p /cre/dev/cre-app # vue-native needs directory not existing yet
mkdir -p /cre/dev
cd /cre/dev

## npm set init.author.email "example-user@example.com"
## npm set init.author.name "example_user"
## npm config set init.author.url http://iamsim.me/
npm set init.version "${CRE_VERSION}.0"
npm set init.license "Apache-2.0"

# https://docs.npmjs.com/creating-a-package-json-file#default-values-extracted-from-the-current-directory
#npm init -y

rm -Rf cre-app # make sure directory does not exist
#vue-native init cre-app #interactive needs prompts, so use script with expect instead
/cre/vue-native-init.sh cre-app creApp

cd /cre/dev/cre-app

#https://capacitorjs.com/
npm install @capacitor/cli @capacitor/core

echo 'before'
npx cap init --help
#npx cap init creApp 000000 --web-dir=build
echo 'after'

npx cap add ios
npx cap add android


npm-install-peers

##npm link react 
##npm link react-native
##chmod -R 777 /cre/dev/cre-app/react-native  

#npm link webpack

npm install --save

#npm i expo

## EXPO only...
# expo init --non-interactive --template bare-minimum --name creApp creApp works....
##expo init demoProject --template blank --workflow managed

exec "$@"
