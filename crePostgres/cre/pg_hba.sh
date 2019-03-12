#!/bin/sh 

sleep 12

until [ ! -e /cre/database-busy.txt ]
do
 echo "Database is busy"
 sleep 2;
done

if [ /cre/pg_hba.conf -nt /etc/postgresql/${POSTGRES_VERSION}/main/pg_hba.conf ]
then
   echo "Activate Database Restrictions" 
   cp -f /cre/pg_hba.conf /etc/postgresql/${POSTGRES_VERSION}/main/pg_hba.conf
   sleep 0.15
   service postgresql restart
fi
