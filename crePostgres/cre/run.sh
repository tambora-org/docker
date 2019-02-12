#!/bin/bash

##POSTGRES_VERSION=9.5 

POSTGRESQL_BIN=/usr/lib/postgresql/${POSTGRES_VERSION}/bin/postgres
POSTGRESQL_CONFIG_FILE=/etc/postgresql/${POSTGRES_VERSION}/main/postgresql.conf
POSTGRESQL_DATA=/var/lib/postgresql/${POSTGRES_VERSION}/main

exec sudo -u postgres $POSTGRESQL_BIN -D $POSTGRESQL_DATA -c config_file=$POSTGRESQL_CONFIG_FILE
#exec $POSTGRESQL_BIN -D $POSTGRESQL_DATA -c config_file=$POSTGRESQL_CONFIG_FILE