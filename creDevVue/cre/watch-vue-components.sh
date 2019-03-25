#!/bin/bash 

# Use inotifywait to detect new files
# (First parameter is path) // should be /cre/glue

watch_path=$1
watch_path=/cre/vue-components

if [ ! -d $watch_path ]; then
  echo "[FAIL]: Directory $watch_path not found!"
  exit 1
fi

#Once do for all
for filename in $watch_path/*.vue; do
  /cre/prepare-web-component.sh $filename
done
#Copy all js
for filename in $watch_path/*.js; do
  /cre/prepare-web-component.sh $filename
done

#Then watch changes
while true; do
  echo "[WATCH]ing files in $watch_path"
  inotifywait -mrq -e create -e modify -e moved_to --exclude 'docker-gen.*' --format %w%f $watch_path | while read FILE
  do
    echo "[WATCH]: File recognized: $FILE"
    /cre/prepare-web-component.sh $FILE &
    /cre/prepare-multiple-web-component.sh $FILE &
  done
done

