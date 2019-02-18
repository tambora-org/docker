#!/bin/bash

# Use inotifywait to detect new files
# First parameter is path

if [ ! -d /cre/glue ]; then
  echo "[FAIL]: Directory /cre/glue not found!"
  exit 1
fi

inotifywait -mrq -e create --exclude '/cre/glue/docker-gen\.' --format %w%f /cre/glue | while read FILE
do
  /cre/watch-template.sh $FILE
done

