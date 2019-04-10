#!/usr/bin/env bash
set -e 

tempdir=/cre/tmp

## patchfile(orig.js patch.js functionName)
patchfile () {
jsfile=$1
patchfile=$2
functionname=$3

if [ -f $jsfile ]; then
  nakedfile=$(echo "$jsfile" | rev | cut -f 2- -d '.' | rev)
  origfile="$nakedfile.orig.js"
  namefile=$(basename "$jsfile") 
  findstring="function $functionname ("
  replacestring="function ${functionname}Orig ("
  splitstring="/function ${functionname}Orig (/"

  mkdir -p $tempdir
  rm -rf $tempdir/* 

  cp -f $jsfile $origfile
  cp -f $jsfile $tempdir/$namefile
  sed -i -- "s/$findstring/replacestring/g" $tempdir/$namefile
  csplit -s $tempdir/$namefile $splitstring
  # xx00 & xx01

  if [ -f $tempdir/xx01 ]; then
    echo $tempdir/xx00 > $tempdir/$namefile
    echo $patchfile >> $tempdir/$namefile
    echo $tempdir/xx01 >> $tempdir/$namefile
    cp -f $tempdir/$namefile $jsfile
  fi
else
  echo "File to patch not found: $jsfile"  
fi
}

origdir=/cre/node/node_modules/@vue/web-component-wrapper/dist
patchdir=/cre/node/vue-common

patchfile $origdir/vue-wc-wrapper.global.js $patchdir/toVNode.patch.js "toVNode" 
patchfile $origdir/vue-wc-wrapper.js $patchdir/toVNode.patch.js "toVNode" 

origdir=/cre/node/.npm-global/lib/node_modules/@vue/cli-service/node_modules/@vue/web-component-wrapper/dist
patchdir=/cre/node/vue-common

patchfile $origdir/vue-wc-wrapper.global.js $patchdir/toVNode.patch.js "toVNode" 
patchfile $origdir/vue-wc-wrapper.js $patchdir/toVNode.patch.js "toVNode" 

# docker exec w4uvue cat /cre/node/.npm-global/lib/node_modules/@vue/cli-service/package.json
# docker exec w4uvue ls -l /cre/node/.npm-global/lib/node_modules/@vue/cli-service/node_modules/@vue/web-component-wrapper/dist
# docker exec w4uvue ls -l /cre/node/node_modules/@vue/web-component-wrapper/dist












