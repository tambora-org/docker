#!/bin/bash 

# Use inotifywait to detect new files
# (First parameter is path) // should be /cre/glue

watch_path=$1
watch_path=/cre/vue-components

if [ ! -d $watch_path ]; then
  echo "[FAIL]: Directory $watch_path not found!"
  exit 1
fi

#Initially once do for all
#Handle all js
js_files=$(find $watch_path -type f -name '*.vue')
for filename in $js_files/*.js; do
  /cre/prepare-web-component.sh $filename $watch_path
done
#Handle all vue
vue_files=$(find $watch_path -type f -name '*.vue')
for filename in $vue_files; do
  /cre/prepare-web-component.sh $filename $watch_path
done

#Then watch changes
while true; do
  echo "[WATCH]ing files in $watch_path"
  inotifywait -mrq -e create -e modify -e moved_to --exclude 'docker-gen.*' --format %w%f $watch_path | while read FILE
  do
    echo "[WATCH]: File recognized: $FILE"
    /cre/prepare-web-component.sh $FILE $watch_path &
    /cre/prepare-multiple-web-components.sh $FILE $watch_path &
  done
done

