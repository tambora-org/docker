#!/usr/bin/env bash
set -e

POSTGRES_ROOT_PWD=${POSTGRES_ROOT_PWD:-"postgres"}

echo "Setting up new power user credentials."

POSTGRESQL_BIN=/usr/lib/postgresql/${POSTGRES_VERSION}/bin
POSTGRESQL_CONFIG_FILE=/etc/postgresql/${POSTGRES_VERSION}/main/postgresql.conf
POSTGRESQL_DATA=/var/lib/postgresql/${POSTGRES_VERSION}/main

if [ ! -d "$POSTGRESQL_DATA" ]; then
  echo "${POSTGRES_ROOT_PWD}" > /var/lib/postgresql/pwfile

echo "Run initdb..."

/usr/lib/postgresql/${POSTGRES_VERSION}/bin/initdb \
    --pgdata=/var/lib/postgresql/${POSTGRES_VERSION}/main --pwfile=/var/lib/postgresql/pwfile \
    --username=postgres --encoding=unicode --auth=trust >/dev/null

echo "... initdb done"
fi

sleep 5
echo "[i] Setting end,have fun."

exec "$@"
