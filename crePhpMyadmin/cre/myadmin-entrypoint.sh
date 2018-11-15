#!/usr/bin/env bash
set -e 

rm -R -f /cre/www/myadmin/*
cp -R -f /usr/share/phpmyadmin /cre/www/myadmin

exec "$@"
