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

if [ ${filename: -3} == ".js" ]; then
  echo "[JS]: Copy javascript file $filename"
  cp $filename "/cre/dev/cre-components/src/components/$filename"  
fi


nakedname=$(echo "$filename" | rev | cut -f 2- -d '.' | rev)         # /cre/vue-components/MyComponent
camelcase=$(basename "$nakedname")                                   # MyComponent 
buildfile="/cre/dev/cre-components/src/components/$camelcase.vue"    # /cre/dev/cre-components/src/components/MyComponent.vue

if [ ${filename: -4} == ".vue" ]; then
  echo "[VUE]: Filename must end with *.vue"
  cp -f $filename $buildfile
fi

 
directory=$(dirname "$filename")                                     # /cre/vue-components
nakedname=$(echo "$filename" | rev | cut -f 2- -d '.' | rev)         # /cre/vue-components/MyComponent
ownscript="$nakedname.js"                                            # /cre/vue-components/MyComponent.js  
camelcase=$(basename "$nakedname")                                   # MyComponent 
minuscase=$(echo $camelcase | sed 's/\(.\)\([A-Z]\)/\1-\2/g')        # My-Component
kebabcase=$(echo $minuscase  | tr '[:upper:]' '[:lower:]')           # my-component 
buildscript="/cre/dev/cre-components/src/$camelcase.js"              # /cre/dev/cre-components/src/MyComponent.js

#collect all into single file

buildscript="/cre/dev/cre-components/src/AllMk.js" # should be derrived from directory
cp -f /cre/dev/vue-common/main-header.js $buildscript
for vuefile in $directory/*.vue
do
  nakedname=$(echo "$vuefile" | rev | cut -f 2- -d '.' | rev) 
  camelcase=$(basename "$nakedname")     
  echo "import $camelcase from './components/$camelcase';"  >> $buildscript
done
for vuefile in $directory/*.vue
do
  nakedname=$(echo "$vuefile" | rev | cut -f 2- -d '.' | rev) 
  camelcase=$(basename "$nakedname") 
  minuscase=$(echo $camelcase | sed 's/\(.\)\([A-Z]\)/\1-\2/g')        
  kebabcase=$(echo $minuscase  | tr '[:upper:]' '[:lower:]')   
  elemname="${camelcase}Elem"
  echo "const $elemname = wrap(Vue, $camelcase);" >> $buildscript
  echo "window.customElements.define('$kebabcase', $elemname);" >> $buildscript
done

## TODO Handle own script...

cd /cre/dev/cre-components
echo "Build web components in directory: $directory"
vue-cli-service build --target wc --name AllMk ./src/all-mk.js   #target lib?
vue-cli-service build --target wc-async --name AsyncMk 'src/components/*.vue'
cp /cre/dev/cre-components/dist/all-mk.* /cre/web-components/

## https://cli.vuejs.org/guide/build-targets.html  -> Multiple & Bundle!

