#!/bin/sh 

sleep 2

if [ ! -f /cre/versions.txt ]; then
    echo "[FAIL]: File /cre/versions.txt not found!"
    exit 1
fi

if [ ! -f /cre/php-procfile ]; then
    echo "[FAIL]: File /cre/exim-procfile not found!"
    exit 1
fi

sleep 2

#Do some fancy tests....?

echo "[SUCCESS]"
exit 0
