#!/bin/bash 

# for avoiding temporary files
sleep 0.1

if [[ -z "$1" ]]; then
    echo "[FAIL]: No filename given !"
    exit 1
fi

filename=$1                                                          # /cre/vue-component/my-subdir/MyComponent.vue 
wc_path=$(dirname "$filename")                                       # /cre/vue-component/my-subdir 

if [ ! -f $filename ]; then
    echo "[FAIL]: File $filename not found !"
    exit 1
fi

if [[ -z "$2" ]]; then
    echo "[FAIL]: No second argument given !"
    exit 1
fi

if [[ ! -d "$2" ]]; then
    echo "[FAIL]: No root directory given !"
    exit 1
fi

root_path=$2                                                         # /cre/vue-component

counter=0
#maybe more file types to be added 
if [ ${filename: -3} == ".js" ] || [ ${filename: -4} == ".vue" ] ; then
  echo "[WC]: Detected modified file $filename"
##  until [ ! ${#wc_path} -lt ${#root_path} ]
  until [ ${#wc_path} -lt ${#root_path} ]
  do
    /cre/build-web-components-directory.sh $wc_path $root_path
    wc_path=$(dirname "$wc_path") 
    counter=$((counter+1))
    if [[ "$counter" -gt 20 ]]; then
      echo "[FAIL]: Endless loop detected!"
      exit 1
    fi
  done
fi

