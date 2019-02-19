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

## shift to get rid of first parameter - only the rest is needed
shift 
while true; do 
 inotifywait -q --format %e /cre/glue/$newname | while read EVENT
 do
  echo "$EVENT has triggered for File $newname, execute: $@"
  sleep 0.25 
  $@
 done
 echo "Restart inotifywait for /cre/glue/$newname"
done &



sleep 1
echo "Now to copy file: /cre/$filename to ..."

{ echo -n '{{ $CurrentContainer := where $ "Config.Hostname" '; cat /etc/hostname; echo -n -e ' | first }} \n'; cat /cre/$filename; } > /cre/$filename.temporary

#cp /cre/$filename.temporary /cre/glue/$filename 
cp /cre/$filename /cre/glue/$filename 

echo "... to destination: /cre/glue/$filename " &
wait

echo "Upps - finished, but should not..."
