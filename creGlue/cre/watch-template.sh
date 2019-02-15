#!/bin/bash

# Use docker-gen to create the template file
# First parameter is file name (with path)
# Created file is same, but without *.tmpl extension

filename=$1

if [ ! -f $filename ]; then
    echo "[FAIL]: File $filename not found inside /cre !"
    exit 1
fi

if [ ! ${filename: -5} == ".tmpl" ]; then
  echo "[FAIL]: Filename must end with *.tmpl"
  exit 1
fi

newname=$(echo "$filename" | rev | cut -f 2- -d '.' | rev)

echo "Do docker-gen for $filename and $newname ."

docker-gen -watch $filename $newname