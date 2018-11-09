#!/usr/bin/env bash
set -e

/cre/mysql-entrypoint.sh

rm -R -f /cre/www/myadmin/*
cp -R -f /usr/share/phpmyadmin /cre/www/myadmin

exec "$@"