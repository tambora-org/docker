#!/bin/bash 
export TERM=xterm  
echo "Postgres weekly"

#### https://www.postgresql.org/docs/9.1/backup-dump.html

## pg_dumpall > backup_file
 # psql -f backup_file postgres


## docker exec postgres pg_dump --no-privileges --no-owner -U clim-admin  -f /cre/pg_gisdata_2019_03_01.bak gisdata
 # psql empty_database < backup_file
 # psql  --single-transaction empty_database < backup_file

### pg_dump --no-privileges --no-owner dbname | gzip > filename.gz
 ## gunzip -c filename.gz | psql dbname
 ## cat filename.gz | gunzip | psql dbname

# needs zlib
### pg_dump --no-privileges --no-owner -Fc dbname > filename
 ## pg_restore --no-owner -d dbname filename
 ## pg_restore --role=rolename -d dbname filename
          

pg_ctl -D $POSTGRESQL_DATA status
