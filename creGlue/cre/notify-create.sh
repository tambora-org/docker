#!/bin/bash

# Use inotifywait to detect new files
# (First parameter is path) // should be /cre/glue

watch_path=$1
watch_path=/cre/glue

if [ ! -d $watch_path ]; then
  echo "[FAIL]: Directory $watch_path not found!"
  exit 1
fi

rm -f $watch_path/*.*

while true; do
  echo "[WATCH]ing files in $watch_path"
  inotifywait -mrq -e create --exclude 'docker-gen.*' --format %w%f $watch_path | while read FILE
  do
    echo "[WATCH]: New file created: $FILE"
    /cre/watch-template.sh $FILE &
  done
done

