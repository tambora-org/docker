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

slash_number=$(echo "$subdir_path" | tr -cd '/' | wc -c)
if [[ 1 -ne $slash_number ]]; then
  echo "no first level sub-directory detected: $subdir_path"
  exit 1
fi

if [[ ! -z "$subdir_path" ]]; then
  last_path=$(echo "$dst_path" | rev | cut -f 1 -d '/' | rev)
  subst_minus=${last_path//[^-]}
  count_minus=${#subst_minus} 
  ## component name should at least have one minus
  if [[ 0 -eq $count_minus ]]; then
     wc_name=$(echo "wc-$last_path"  | tr '[:upper:]' '[:lower:]')
  else
     wc_name=$(echo "$last_path"  | tr '[:upper:]' '[:lower:]')
  fi
fi

# wait till untouched
until [ ! -e /cre/web-components-build-busy.txt ]
do
 echo "Web Components get already build in the moment - wait some seconds"
 sleep 2;
done
# touch file
touch /cre/web-components-build-busy.txt

# clear directory first, prepare additional installation file
rm -rf /cre/node/cre-components
cp -rf /cre/node/wc-template /cre/node/cre-components
rm -rf /cre/node/js-components
cp -rf /cre/node/js-template /cre/node/js-components


rm -rf /cre/node/cre-components/src/components/*
# then copy local files and those in subdirs (may add more types)
find $wc_path -maxdepth 999 -type d -print0 | while IFS= read -rd '' subdir_path; do 
  cp $subdir_path/*.js  /cre/node/cre-components/src/components/  2>/dev/null
  cp $subdir_path/*.js  /cre/node/js-components/src/              2>/dev/null
  cp $subdir_path/*.vue /cre/node/cre-components/src/components/  2>/dev/null
  cp $subdir_path/README.md  /cre/node/cre-components/README.md    2>/dev/null
  cp $subdir_path/README.md  /cre/node/js-components/README.md    2>/dev/null

  #hook for installing more npm modules 
  ## may better copy/merge first... (current dir js vs wc)
  if [[ -e "$subdir_path/install.sh" ]]; then
    ## $subdir_path/install.sh  ## install later
    echo $subdir_path/install.sh >> /cre/node/cre-components/install.sh
    echo $subdir_path/install.sh >> /cre/node/js-components/install.sh
    # npm-install-peers
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
rm -rf $dst_path/sync/*
mkdir -p $npm_path

existingNpm () {
  npm_package=$1
  npm_path=$2

  #if [ -f $npm_path/package.json ]; then
  #  cp -f $npm_path/package.json ./    #REALLY??
  #fi
  curr_version=$(npm view $npm_package version 2>/dev/null)
  if [ "$curr_version" != "" ]; then
    echo "Current npm-version found: $curr_version" 
    compare=$(dpkg --compare-versions $curr_version "gt" "${CRE_VERSION}.0")  
    if [ "$compare" == "0" ]; then
       npm config set allow-same-version true
       npm version curr_version
       npm version patch
     fi
  fi
  rm -rf $npm_path/*
}

addNpmSetings () {
  wc_name=$1
  subdir_path=$2
  if [[ -e ./README.md ]]; then
    descr=$(head -n 1 ./README.md)
    json -I -f package.json -e "this.description='$descr'"
  fi
  ## main file
  ## for wc use dist/wc-${subdir_path:1}.min.js  # or without wc....
  if [[ -e ./dist/$wc_name.min.js ]]; then
     json -I -f package.json -e "this.main='./dist/$wc_name.min.js'"
     json -I -f package.json -e "this.unpkg='./dist/$wc_name.min.js'"
  else 
    js_files=$(ls -1 ./src/*.js)
    js_number=$(ls -1 ./src/*.js | wc -l)
    if [[ 1 -eq $js_number ]]; then
     json -I -f package.json -e "this.main='$js_files'"
     json -I -f package.json -e "this.unpkg='$js_files'"
    else
      if [[ -e ./src/index.js ]]; then  
        json -I -f package.json -e "this.main='./src/index.js'"  
        json -I -f package.json -e "this.unpkg='./src/index.js'"   
      fi
    fi
  fi

  json -I -f package.json -e "this.name='${subdir_path:1}'"
  json -I -f package.json -e 'this.private=false'
  # if env git-url set
  json -I -f package.json -e "this.repository={}"
  json -I -f package.json -e 'this.repository.type="git"'
  json -I -f package.json -e "this.repository.url='https://github.com/webedu/npm.git'"
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
}

addWCbuild () {
  wc_name=$1
  crazy_kebab=$2
  npmAddScript -k build1a -v "vue-cli-service build  --report --target wc-async --name $crazy_kebab 'src/components/*.vue'" -f
  npmAddScript -k build1 -v "vue-cli-service build  --report --target wc --name $crazy_kebab 'src/components/*.vue'" -f
  npmAddScript -k build2 -v "sed -i -e \"s/${crazy_kebab}-//g\" ./dist/*.*" -f
  npmAddScript -k build3 -v "sed -i -e \"s/${crazy_kebab}/${wc_name}/g\" ./dist/*.*" -f
  npmAddScript -k build4 -v "rename \"s/$crazy_kebab/$wc_name/\" ./dist/*.*" -f
  npmAddScript -k build0 -v "npm run build1 && npm run build2 && npm run build3 && npm run build4" -f

}

echo "Build something in sub-directory: $subdir_path, #vue: $vue_number, wc: $wc_name"

if [[ 0 -eq $vue_number ]]; then
  cd /cre/node/js-components
  echo "Build js components in sub-directory: $subdir_path"
  rm -rf /cre/node/js-components/dist/*
  existingNpm $wc_name $npm_path  ## Needs adaption: dir name or kebabed dir name
  ./install.sh && rm ./install.sh
  addNpmSetings $wc_name $subdir_path
  npm install
  cp -f /cre/node/js-components/src/*.* $dst_path/sync/
  cp -f -r /cre/node/js-components/* $npm_path
else
  cd /cre/node/cre-components
  echo "Build web components in sub-directory: $subdir_path"
  rm -rf /cre/node/cre-components/dist/*
  existingNpm $wc_name $npm_path
  ./install.sh && rm ./install.sh
  addNpmSetings $wc_name $subdir_path
  addWCbuild $wc_name $crazy_kebab
  npm run build0
  #now in build script
  #vue-cli-service build  --report --target wc --name $crazy_kebab 'src/components/*.vue'
  #sed -i -e "s/${crazy_kebab}-//g" /cre/node/cre-components/dist/*.*
  #sed -i -e "s/${crazy_kebab}/${wc_name}/g" /cre/node/cre-components/dist/*.*
  #rename "s/$crazy_kebab/$wc_name/" /cre/node/cre-components/dist/*.*
  cp -f /cre/node/cre-components/dist/*.* $dst_path/sync/
  cp -f -r /cre/node/cre-components/* $npm_path
fi


#remove touch file
rm -f /cre/web-components-build-busy.txt
