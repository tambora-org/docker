#!/bin/bash 
export TERM=xterm  
echo "Postgres weekly"

pg_ctl -D $POSTGRESQL_DATA status
