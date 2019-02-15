#!/bin/bash

# Use Glue to create the template file
# First parameter is file name - must be located in /cre
# Also a dummy file of the destination file must be located there
# Rest of parameters is command and parameters to execute on change

filename=$1
newname=$(echo "$filename" | rev | cut -f 2- -d '.' | rev)

if [ ! -f /cre/$filename ]; then
    echo "[FAIL]: File $filename not found inside /cre !"
    exit 1
fi

if [ ! -f /cre/$newname ]; then
    echo "[FAIL]: File $newname not found inside /cre !"
    exit 1
fi

if [ ! ${filename: -5} == ".tmpl" ]; then
  echo "[FAIL]: Filename must end with *.tmpl"
  exit 1
fi

if [ ! -d /cre/glue ]; then
  echo "[FAIL]: Directory /cre/glue not found! Use volumes_from cre-glue to fix"
  exit 1
fi

cp /cre/$newname /cre/glue/$newname

shift
#inotifywait -e modify /cre/glue/$newname && "$@" &
inotifywait -mrq -e modify --format %w%f /cre/glue/$newname | while read FILE
do
  echo "$File has changed, execute: $@"
  $@
done &

cp /cre/$filename /cre/glue/$filename




