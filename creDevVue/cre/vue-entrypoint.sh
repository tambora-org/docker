#!/usr/bin/env bash
set -e 

# /cre/php-entrypoint.sh # later maybe php-dev-entrypoint.sh

mkdir -p /cre/dev/cre-components
cd /cre/dev

## npm set init.author.email "example-user@example.com"
## npm set init.author.name "example_user"
## npm config set init.author.url http://iamsim.me/
npm set init.version "${CRE_VERSION}.0"
npm set init.license "Apache-2.0"
# https://docs.npmjs.com/creating-a-package-json-file#default-values-extracted-from-the-current-directory
#npm init -y

# preset? ./vuerc
vue create -d -f cre-components

cd /cre/dev/cre-components

npm install --save-dev @vue/web-component-wrapper 

exec "$@"