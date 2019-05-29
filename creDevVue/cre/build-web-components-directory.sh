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
npm_path="/cre/npm-components/$subdir_path"
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
rm -rf /cre/node/cre-components/src/* 
rm -rf /cre/node/js-components/src/* 
mkdir -p /cre/node/cre-components/src/components
# then copy local files and those in subdirs (may add more types)
find $wc_path -maxdepth 999 -type d -print0 | while IFS= read -rd '' subdir_path; do 
  cp $subdir_path/*.js  /cre/node/cre-components/src/components/
  cp $subdir_path/*.vue /cre/node/cre-components/src/components/
  cp $subdir_path/*.js  /cre/node/js-components/src/
  #hook for installing more npm modules 
  ## may better copy/merge first... (current dir js vs wc)
  if [[ -e "$subdir_path/install.sh" ]]; then
    $subdir_path/install.sh
  fi  
done
# Only necassary if only one vue file exists
vue_number=$(ls -1 /cre/node/cre-components/src/components/*.vue | wc -l)
if [[ 1 -eq $vue_number ]]; then
  cp /cre/node/vue-common/WcDummy.vue /cre/node/cre-components/src/components/
fi

# Here comes a crazy workaround
# vue-cli-service uses name for filename AND as components prefix
# check if single file needs special handling?
crazy_camel="PleaseRemoveMeAsSoonAsPossible"
crazy_minus=$(echo $crazy_camel | sed 's/\(.\)\([A-Z]\)/\1-\2/g')        
crazy_kebab=$(echo $crazy_minus  | tr '[:upper:]' '[:lower:]')    
mkdir -p $dst_path/sync

if [[ 0 -eq $vue_number ]]; then
  cd /cre/node/js-components
  echo "Build js components in sub-directory: $subdir_path"
  rm -rf /cre/node/js-components/dist/*
  npm build
  cp -f /cre/node/cre-components/dist/*.* $dst_path/sync/
elif
  cd /cre/node/cre-components
  echo "Build web components in sub-directory: $subdir_path"
  rm -rf /cre/node/cre-components/dist/*
  vue-cli-service build  --report --target wc --name $crazy_kebab 'src/components/*.vue'
  sed -i -e "s/${crazy_kebab}-//g" /cre/node/cre-components/dist/*.*
  sed -i -e "s/${crazy_kebab}/${wc_name}/g" /cre/node/cre-components/dist/*.*
  rename "s/$crazy_kebab/$wc_name/" /cre/node/cre-components/dist/*.*
  cp -f /cre/node/cre-components/dist/*.* $dst_path/sync/
fi


slash_number=$(echo "$subdir_path" | tr -cd '/' | wc -c)
if [[ 1 -eq $slash_number ]]; then
  echo "first level sub-directory detected: $subdir_path"
  npmAddScript -k build1 -v "vue-cli-service build  --report --target wc --name $crazy_kebab 'src/components/*.vue'" -f
  npmAddScript -k build2 -v "sed -i -e \"s/${crazy_kebab}-//g\" /cre/node/cre-components/dist/*.*" -f
  npmAddScript -k build3 -v "sed -i -e \"s/${crazy_kebab}/${wc_name}/g\" /cre/node/cre-components/dist/*.*" -f
  npmAddScript -k build4 -v "rename \"s/$crazy_kebab/$wc_name/\" /cre/node/cre-components/dist/*.*" -f
  npmAddScript -k build0 -v "build1 && build2 && build3 && build4" -f

  json -I -f package.json -e "this.name='${subdir_path:1}'"
  json -I -f package.json -e 'this.private=false'
  # if env git-url set
  json -I -f package.json -e "this.repository={}"
  json -I -f package.json -e 'this.repository.type="git"'
  json -I -f package.json -e "this.repository.url='git=https://github.com/webedu/npm.git'"
  #add keywords
  json -I -f package.json -e 'this.keywords=[]'
  json -I -f package.json -e 'this.keywords.push("web-components")'
  json -I -f package.json -e "this.keywords.push('${subdir_path:1}')"
  # if c4u
  if [ ${subdir_path:1:3} == "c4u" ]; then
    json -I -f package.json -e 'this.keywords.push("components4you")'
    json -I -f package.json -e 'this.keywords.push("c4u")'
  fi
  if [ ${subdir_path:1:3} == "w4u" ]; then 
    json -I -f package.json -e 'this.keywords.push("webedu")'
    json -I -f package.json -e 'this.keywords.push("w4u")' 
  fi

  mkdir -p $npm_path
  rm -rf $npm_path/*
  if [[ 0 -eq $vue_number ]]; then
    cp -f -r /cre/node/js-components/* $npm_path
  elif
    cp -f -r /cre/node/cre-components/* $npm_path
  fi
fi

rm -rf /cre/node/cre-components/dist/*
##vue-cli-service build --target wc-async --name $wc_name 'src/components/*.vue'
vue-cli-service build  --report --target wc-async --name $crazy_kebab 'src/components/*.vue'
sed -i -e "s/${crazy_kebab}-//g" /cre/node/cre-components/dist/*.*
sed -i -e "s/${crazy_kebab}/${wc_name}/g" /cre/node/cre-components/dist/*.*
rename "s/$crazy_kebab/$wc_name/" /cre/node/cre-components/dist/*.*
mkdir -p $dst_path/async
cp -f /cre/node/cre-components/dist/*.* $dst_path/async/


#build single files (in local dir only)
rm -rf /cre/node/cre-components/src/* 
mkdir -p /cre/node/cre-components/src/components
# then copy files (may add more types)
cp $wc_path/*.js  /cre/node/cre-components/src/components/
cp $wc_path/*.vue /cre/node/cre-components/src/components/

rm -rf /cre/node/cre-components/dist/*
mkdir -p $dst_path/single/
for filename in /cre/node/cre-components/src/components/*.vue; do
  /cre/build-web-components-file.sh $filename $dst_path/single/
done

#remove touch file
rm -f /cre/web-components-build-busy.txt
