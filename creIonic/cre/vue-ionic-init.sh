#!/usr/bin/expect -f 

lassign $argv appDir appName

#git clone https://github.com/KMicha/cre-test.git $appDir
ionic start $appDir tabs
##/cre/node/.npm-global/bin/ionic start $appDir tabs
# /cre/node/.npm-global/bin/ionic -> /cre/node/.npm-global/lib/node_modules/ionic/bin/ionic
cd cre-test && npm install 

## && ionic serve


# https://ionicframework.com/docs/intro/cdn
#ionic start myApp tabs
#ionic start myApp none
#ionic start myApp sidemenu

