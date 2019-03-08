#!/bin/bash 

# Use docker-gen to create the template file
# First parameter is file name (with path)
# Created file is same, but without *.tmpl extension

if [[ -z "$1" ]]; then
    echo "[FAIL]: No filename given !"
    exit 1
fi

filename=$1                                                          # /cre/vue-component/MyComponent.vue 

if [ ! -f $filename ]; then
    echo "[FAIL]: File $filename not found !"
    exit 1
fi

if [ ! ${filename: -4} == ".vue" ]; then
  echo "[FAIL]: Filename must end with *.vue"
  exit 1
fi

nakedname=$(echo "$filename" | rev | cut -f 2- -d '.' | rev)         # /cre/vue-component/MyComponent
camelcase=$(basename "$nakedname")                                   # MyComponent      
minusbcase=$(echo $camelcase | sed 's/\(.\)\([A-Z]\)/\1-\2/g')       # My-Component
kebabcase=$(echo $minuscase  | tr '[:upper:]' '[:lower:]')           # my-component 
buildscript="/cre/dev/cre-components/src/$camelcase.js"              # /cre/tmp/dev/vue-component/src/MyComponent.js
buildfile="/cre/dev/cre-components/src/components/$camelcase.vue"    # /cre/tmp/dev/vue-component/src/components/MyComponent.vue

cp -f $filename $buildfile
cp -f /cre/dev/vue-common/main-header.js $buildscript
echo "import $camelcase from './components/$camelcase';"  >> $buildfile
echo "const MyWebElement = wrap(Vue, $camelcase);" >> $buildfile
echo "window.customElements.define('$kebabcase', MyWebElement);" >> $buildfile

cd /cre/dev/vue-components
echo "Build web component '$kebabcase' from $filename"
vue-cli-service build --target wc --name $kebabcase ./src/$camelcase.js
#copy to /cre/web-component/*.js
#collect all into single file





