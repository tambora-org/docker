#!/bin/bash 

# Use inotifywait to detect new files
# (First parameter is path) // should be /cre/glue

root_path=$1
root_path=/cre/vue-components

if [ ! -d $root_path ]; then
  echo "[FAIL]: Directory $root_path not found!"
  exit 1
fi

#Initially once do for all subdirectories
find $root_path -maxdepth 5 -type d -print0 | while IFS= read -rd '' wc_path; do 
  /cre/build-web-components-directory.sh $wc_path $root_path
done
/cre/build-web-components-directory.sh $root_path $root_path

#Then watch changes
while true; do
  echo "[WATCH]ing files in $root_path"
  inotifywait -mrq -e create -e modify -e moved_to --exclude 'docker-gen.*' --format %w%f $root_path | while read wc_file
  do
    echo "[WATCH]: File recognized: $wc_file"
    /cre/handle-web-components-file.sh $wc_file $root_path &
  done
done

