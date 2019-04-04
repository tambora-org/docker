#!/bin/sh 

sleep 0.25
if [ /cre/main.cf -nt /etc/postfix/main.cf ]
then
   # cp -f /cre/main.cf /etc/postfix/main.cf
   sleep 0.25
   /sbin/service postfix restart
fi
