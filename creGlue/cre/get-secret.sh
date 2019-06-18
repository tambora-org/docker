#!/bin/bash

# Returns first line of secret file (used for passwords, etc)
# (First parameter is path&file or file in /cre/secrets
# (Second optional parameter is fallback value)

secret_file=$1
secret_path=/cre/secrets

if [ -f $secret_file ]; then
    secret_path_and_file=$secret_file
else
    secret_path_and_file=$secret_path/$secret_file
fi

if [ ! -f $secret_path_and_file ]; then
    if [ -z "$2" ]
      echo "[FAIL]: Secret file $secret_path_and_file not found !"
      exit 1
    else
      echo "$2"
      exit 0
fi

first_line="$(head -n 1 $secret_path_and_file)"
echo "$first_line"
