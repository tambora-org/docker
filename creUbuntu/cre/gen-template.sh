#!/bin/bash

# Use Glue to create the template file
# First parameter is file name  with path - best practise: located in /cre
# Also a dummy file of the destination file must be located at same path
# Rest of parameters is command and parameters to execute on change

# Every container should have it's own set of files inside glue
hostname=$(cat /etc/hostname | tr -d '\n' )
file_tmpl=$1
file_result=$(echo "$file_tmpl" | rev | cut -f 2- -d '.' | rev)
host_tmpl="${hostname}_$(basename $file_tmpl)"
host_result="${hostname}_$(basename $file_result)"

if [ ! -f $file_tmpl ]; then
    echo "[FAIL]: File $file_tmpl not found inside /cre !"
    exit 1
fi

if [ ! ${file_tmpl: -5} == ".tmpl" ]; then
  echo "[FAIL]: Filename must end with *.tmpl"
  exit 1
fi

if [ ! -d /cre/glue ]; then
  echo "[FAIL]: Directory /cre/glue not found! Use volumes_from cre-glue to fix"
  exit 1
fi

if [ ! -f $file_result ]; then
    echo "[WARNING]: File $file_result not found inside /cre !"
    touch /cre/glue/$host_result
else
    cp $file_result /cre/glue/$host_result
fi

## shift to get rid of first parameter - only the rest is needed
shift 
while true; do 
 inotifywait -q --format %e /cre/glue/$host_result | while read EVENT
 do
  echo "$EVENT has triggered for File $host_result - copy back"
  sleep 0.20 
  cp -f /cre/glue/$host_result $file_result
  sleep 0.05 
  $@
 done
 echo "Restart inotifywait for /cre/glue/$host_result"
done &



sleep 1
echo "Now to copy file: $file_tmpl to ..."
# Add code to add CurrentContainer in front of file.
{ echo -n '{{ $CurrentContainer := where $ "Hostname" "';
  cat /etc/hostname | tr -d '\n';
  echo -n -e '" | first }} \n';
  cat $file_tmpl; } > /cre/$host_tmpl

mv /cre/$host_tmpl /cre/glue/$host_tmpl 

echo "... to destination: /cre/glue/$host_tmpl " &
wait

echo "Upps - finished, but should not..."
