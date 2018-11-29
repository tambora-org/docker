#!/usr/bin/env bash
set -e

POSTGRES_ROOT_PWD=${POSTGRES_ROOT_PWD:-"postgres"}
#POSTGRES_ROOT_PWD=${POSTGRES_ROOT_PWD:-$(pwgen -c -n -1 14)}
ENV RANDOM_TEXT=$(pwgen -c -n -1 14)} 
#problem: env not available outside


echo "1* RANDOM_DOCKER_DEFAULT: $RANDOM_DOCKER_DEFAULT"
echo "1* RANDOM_DOCKER_RUN: $RANDOM_DOCKER_RUN"
echo "1* RANDOM_TEXT: $RANDOM_TEXT"

echo "2* RANDOM_DOCKER_DEFAULT: $RANDOM_DOCKER_DEFAULT"
echo "2* RANDOM_DOCKER_RUN: $RANDOM_DOCKER_RUN"
echo "2* RANDOM_TEXT: $RANDOM_TEXT"

echo "Setting up new power user credentials."

POSTGRESQL_BIN=/usr/lib/postgresql/${POSTGRES_VERSION}/bin/postgres
POSTGRESQL_CONFIG_FILE=/etc/postgresql/${POSTGRES_VERSION}/main/postgresql.conf
POSTGRESQL_DATA=/var/lib/postgresql/${POSTGRES_VERSION}/main

if [ ! -d "$POSTGRESQL_DATA" ]; then
  echo "${POSTGRES_ROOT_PWD}" > /var/lib/postgresql/pwfile

  sudo -u postgres -H /usr/lib/postgresql/${POSTGRES_VERSION}/bin/initdb \
    --pgdata=/var/lib/postgresql/${POSTGRES_VERSION}/main --pwfile=/var/lib/postgresql/pwfile \
    --username=postgres --encoding=unicode --auth=trust >/dev/null

#  /usr/lib/postgresql/${POSTGRES_VERSION}/bin/initdb \
#    --pgdata=/var/lib/postgresql/${POSTGRES_VERSION}/main --pwfile=/var/lib/postgresql/pwfile \
#    --username=postgres --encoding=unicode --auth=trust >/dev/null
 
#  echo "========================================================================"
#  echo " postgres password is ${POSTGRES_PASSWORD}"
#  echo "========================================================================"
fi

sleep 5
echo "[i] Setting end,have fun."

exec "$@"