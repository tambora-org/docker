#!/bin/bash

##POSTGRES_VERSION=9.5 

POSTGRESQL_BIN=/usr/lib/postgresql/${POSTGRES_VERSION}/bin
POSTGRESQL_CONFIG_FILE=/etc/postgresql/${POSTGRES_VERSION}/main/postgresql.conf
POSTGRESQL_DATA=/var/lib/postgresql/${POSTGRES_VERSION}/main

## check if other server is running, if so, then stop it gentle, wait some seconds and stop it hard.
${POSTGRESQL_BIN}/pg_ctl -D $POSTGRESQL_DATA status
if [ $? -eq 0 ]
then
 echo "Postgres already running - try smart shutdown"
 ${POSTGRESQL_BIN}/pg_ctl -D $POSTGRESQL_DATA -m smart -w stop
fi
sleep 5.0

${POSTGRESQL_BIN}/pg_ctl -D $POSTGRESQL_DATA status
if [ $? -eq 0 ]
then
 echo "Postgres still running - try hard shutdown"
 ${POSTGRESQL_BIN}/pg_ctl -D $POSTGRESQL_DATA -m fast -w stop
fi
sleep 1.0

echo "start postgres server"
exec ${POSTGRESQL_BIN}/postgres -D $POSTGRESQL_DATA -c config_file=$POSTGRESQL_CONFIG_FILE