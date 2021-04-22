#!/usr/bin/bash

lassign $argv appDir appName

git clone https://github.com/KMicha/cre-test.git $appDir
cd cre-test && npm install && ionic serve


# https://ionicframework.com/docs/intro/cdn
#ionic start myApp tabs
#ionic start myApp none
#ionic start myApp sidemenu

