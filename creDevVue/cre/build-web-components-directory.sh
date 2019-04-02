#!/bin/bash 

if [[ -z "$1" ]]; then
    echo "[FAIL]: No first argument given !"
    exit 1
fi

if [[ ! -d "$1" ]]; then
    echo "[FAIL]: No components directory given !"
    exit 1
fi

wc_path=$1

if [[ -z "$2" ]]; then
    echo "[FAIL]: No second argument given !"
    exit 1
fi

if [[ ! -d "$2" ]]; then
    echo "[FAIL]: No root directory given !"
    exit 1
fi
 
root_path=$2
#
subdir_path=${wc_path#"$root_path"}
dst_path="/cre/web-components/$subdir_path"


# wait till untouched
# touch file

# clear directory first
##rm -rf /cre/dev/cre-components/src/components/* 
rm -rf /cre/dev/cre-components/src/* 
mkdir -p /cre/dev/cre-components/src/components
# then copy files (may add more types)
cp $wc_path/*.js  /cre/dev/cre-components/src/components/
cp $wc_path/*.vue /cre/dev/cre-components/src/components/

#for filename in $wc_path/*.js; do
#  cp $filename "/cre/dev/cre-components/src/components/$(basename $filename)" 
#done
#for filename in $wc_path/*.vue; do
#  cp $filename "/cre/dev/cre-components/src/components/$(basename $filename)" 
#done

cd /cre/dev/cre-components
echo "Build web components in sub-directory: $subdir_path"
rm -rf /cre/dev/cre-components/dist/*
vue-cli-service build --target wc --name sync 'src/components/*.vue'
mkdir -p $dst_path/sync
cp -f /cre/dev/cre-components/dist/*.* $dst_path/sync/

rm -rf /cre/dev/cre-components/dist/*
vue-cli-service build --target wc-async --name async 'src/components/*.vue'
mkdir -p $dst_path/async
cp -f /cre/dev/cre-components/dist/*.* $dst_path/async/

rm -rf /cre/dev/cre-components/dist/*
mkdir -p $dst_path/single/
for filename in /cre/dev/cre-components/src/components/*.vue; do
  /cre/build-web-components-file.sh $filename $dst_path/single/
done

#remove touch file
