#!/bin/bash
set -e

# TODO: If CRE_PHP_ROOT not set: use www
if [[ -z $CRE_PHP_ROOT ]]; then
  CRE_PHP_ROOT='www';
fi


if [[! -d /cre/$CRE_PHP_ROOT ]]
then
  mkdir -p "/cre/$CRE_PHP_ROOT"
fi

cp -f /cre/db-test.php "/cre/$CRE_PHP_ROOT/db-test.php"

exec "$@"
