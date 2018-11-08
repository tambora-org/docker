#!/usr/bin/env bash
set -e

cp -R -f /usr/share/phpmyadmin /cre/www/myadmin

exec "$@"