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
wc_name="wc-main"
if [[ ! -z "$subdir_path" ]]; then
  last_path=$(echo "$dst_path" | rev | cut -f 1 -d '/' | rev)
  wc_name=$(echo "wc-$last_path"  | tr '[:upper:]' '[:lower:]')
fi

# wait till untouched
until [ ! -e /cre/web-components-build-busy.txt ]
do
 echo "Web Components get already build in the moment - wait some seconds"
 sleep 2;
done
# touch file
touch /cre/web-components-build-busy.txt

# clear directory first
##rm -rf /cre/dev/cre-components/src/components/* 
rm -rf /cre/dev/cre-components/src/* 
mkdir -p /cre/dev/cre-components/src/components
# then copy local files and those in subdirs (may add more types)
find $wc_path -maxdepth 999 -type d -print0 | while IFS= read -rd '' subdir_path; do 
  cp $subdir_path/*.js  /cre/dev/cre-components/src/components/
  cp $subdir_path/*.vue /cre/dev/cre-components/src/components/
done

# Here comes a crazy workaround
# vue-cli-service uses name for filename AND as components prefix
# check if single file needs special handling?
crazy_camel="PleaseRemoveMeAsSoonAsPossible"
crazy_minus=$(echo $crazy_camel | sed 's/\(.\)\([A-Z]\)/\1-\2/g')        
crazy_kebab=$(echo $crazy_minus  | tr '[:upper:]' '[:lower:]')    

cd /cre/dev/cre-components
echo "Build web components in sub-directory: $subdir_path"
rm -rf /cre/dev/cre-components/dist/*
##vue-cli-service build --target wc --name $wc_name 'src/components/*.vue'
vue-cli-service build  --report --target wc --name $crazy_kebab 'src/components/*.vue'
sed -i -e "s/${crazy_kebab}-//g" /cre/dev/cre-components/dist/*.*
sed -i -e "s/${crazy_kebab}/${wc_name}/g" /cre/dev/cre-components/dist/*.*
rename "s/$crazy_kebab/$wc_name/" /cre/dev/cre-components/dist/*.*
mkdir -p $dst_path/sync
cp -f /cre/dev/cre-components/dist/*.* $dst_path/sync/

rm -rf /cre/dev/cre-components/dist/*
##vue-cli-service build --target wc-async --name $wc_name 'src/components/*.vue'
vue-cli-service build  --report --target wc-async --name $crazy_kebab 'src/components/*.vue'
sed -i -e "s/${crazy_kebab}-//g" /cre/dev/cre-components/dist/*.*
sed -i -e "s/${crazy_kebab}/${wc_name}/g" /cre/dev/cre-components/dist/*.*
rename "s/$crazy_kebab/$wc_name/" /cre/dev/cre-components/dist/*.*
mkdir -p $dst_path/async
cp -f /cre/dev/cre-components/dist/*.* $dst_path/async/


#build single files (in local dir only)
rm -rf /cre/dev/cre-components/src/* 
mkdir -p /cre/dev/cre-components/src/components
# then copy files (may add more types)
cp $wc_path/*.js  /cre/dev/cre-components/src/components/
cp $wc_path/*.vue /cre/dev/cre-components/src/components/

rm -rf /cre/dev/cre-components/dist/*
mkdir -p $dst_path/single/
for filename in /cre/dev/cre-components/src/components/*.vue; do
  /cre/build-web-components-file.sh $filename $dst_path/single/
done

#remove touch file
rm -f /cre/web-components-build-busy.txt
