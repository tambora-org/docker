#!/bin/bash 

if [[ -z "$1" ]]; then
    echo "[FAIL]: No filename given !"
    exit 1
fi

filename=$1                                                          # /cre/dev/cre-components/src/components/MyComponent.vue

if [ ! -f $filename ]; then
    echo "[FAIL]: File $filename not found !"
    exit 1
fi

if [ ! ${filename: -4} == ".vue" ]; then
  echo "[FAIL]: Filename must end with *.vue"
  exit 1
fi

if [[ -z "$2" ]]; then
    echo "[FAIL]: No second argument given !"
    exit 1
fi

if [[ ! -d "$2" ]]; then
    echo "[FAIL]: No destination directory given !"
    exit 1
fi
 
dest_path=$2

nakedname=$(echo "$filename" | rev | cut -f 2- -d '.' | rev)         # /cre/dev/cre-components/src/components/MyComponent
ownscript="$nakedname.js"                                            # /cre/dev/cre-components/src/components/MyComponent.js
camelcase=$(basename "$nakedname")                                   # MyComponent      
minuscase=$(echo $camelcase | sed 's/\(.\)\([A-Z]\)/\1-\2/g')        # My-Component
kebabcase=$(echo $minuscase  | tr '[:upper:]' '[:lower:]')           # my-component 
buildscript="/cre/node/cre-components/src/$camelcase.js"             # /cre/dev/cre-components/src/MyComponent.js
buildfile=$filename                                                  # /cre/dev/cre-components/src/components/MyComponent.vue

cp -f /cre/node/vue-common/main-header.js $buildscript
echo "import $camelcase from './components/$camelcase';"  >> $buildscript
echo "const MyWebElement = wrap(Vue, $camelcase);" >> $buildscript
echo "window.customElements.define('$kebabcase', MyWebElement);" >> $buildscript

if [ -f $ownscript ]; then
    cp -f $ownscript $buildscript
fi

cd /cre/node/cre-components
echo "Build web component '$kebabcase' from $filename"
vue-cli-service build --target wc --name $kebabcase ./src/$camelcase.js

## results:  /cre/dev/cre-components/dist/my-custom-element.js  &  my-custom-element.min.js & js.map
cp /cre/node/cre-components/dist/$kebabcase.* $dest_path


