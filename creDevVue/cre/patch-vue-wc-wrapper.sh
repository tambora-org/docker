#!/usr/bin/env bash
set -e 

tempdir=/cre/tmp

## patchfile(orig.js patch.js functionName)
patchfile () {
jsfile=$1
patchfile=$2
functionname=$3

if [ -f $jsfile ]; then
  currentdir=$(pwd)
  nakedfile=$(echo "$jsfile" | rev | cut -f 2- -d '.' | rev)
  origfile="$nakedfile.orig.js"
  namefile=$(basename "$jsfile") 
  findstring="function $functionname ("
  replacestring="function ${functionname}Orig ("

  mkdir -p $tempdir
  rm -rf $tempdir/* 
  cd $tempdir

  cp -f $jsfile $origfile
  cp -f $jsfile $tempdir/$namefile
  sed -i -- "s/$findstring/$replacestring/g" $tempdir/$namefile
  csplit -s $tempdir/$namefile "/$replacestring/"
  # xx00 & xx01

  if [ -f $tempdir/xx01 ]; then
    cat $tempdir/xx00 > $tempdir/$namefile
    cat $patchfile >> $tempdir/$namefile
    cat $tempdir/xx01 >> $tempdir/$namefile
    cp -f $tempdir/$namefile $jsfile
  fi
  
  cd $currentdir
else
  echo "File to patch not found: $jsfile"  
fi
}

patchcopy () {
jsfile=$1
patchfile=$2

if [ -f $jsfile ]; then
  nakedfile=$(echo "$jsfile" | rev | cut -f 2- -d '.' | rev)
  origfile="$nakedfile.orig.js"
 
  if [ ! -f $origfile ]; then
    cp -f $jsfile $origfile
  fi
  cp -f $patchfile $jsfile 
 
else
  echo "File to patch not found: $jsfile"  
fi

}

origdir=/cre/node/node_modules/@vue/web-component-wrapper/dist
patchdir=/cre/node/vue-common

##patchfile $origdir/vue-wc-wrapper.global.js $patchdir/toVNode.patch.js "toVNode" 
##patchfile $origdir/vue-wc-wrapper.js $patchdir/toVNode.patch.js "toVNode" 
patchcopy $origdir/vue-wc-wrapper.global.js $patchdir/vue-wc-wrapper.global.patch.js
patchcopy $origdir/vue-wc-wrapper.js $patchdir/vue-wc-wrapper.patch.js

origdir=/cre/node/.npm-global/lib/node_modules/@vue/cli-service/node_modules/@vue/web-component-wrapper/dist
patchdir=/cre/node/vue-common

##patchfile $origdir/vue-wc-wrapper.global.js $patchdir/toVNode.patch.js "toVNode" 
##patchfile $origdir/vue-wc-wrapper.js $patchdir/toVNode.patch.js "toVNode" 
patchcopy $origdir/vue-wc-wrapper.global.js $patchdir/vue-wc-wrapper.global.patch.js
patchcopy $origdir/vue-wc-wrapper.js $patchdir/vue-wc-wrapper.patch.js

# docker exec w4uvue cat /cre/node/.npm-global/lib/node_modules/@vue/cli-service/package.json
# docker exec w4uvue ls -l /cre/node/.npm-global/lib/node_modules/@vue/cli-service/node_modules/@vue/web-component-wrapper/dist
# docker exec w4uvue ls -l /cre/node/node_modules/@vue/web-component-wrapper/dist














