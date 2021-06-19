#!/bin/bash

##POSTGRES_VERSION=12.2

sleep 1
echo "compile postgres extension"
cd /cre/postgresql-src/contrib/extension
make


