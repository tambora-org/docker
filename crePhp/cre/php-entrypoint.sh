#!/bin/bash
set -e

# TODO: If CRE_PHP_ROOT not set: use www
mv -f /cre/db-test.php "/cre/$CRE_PHP_ROOT/db-test.php"

exec "$@"
