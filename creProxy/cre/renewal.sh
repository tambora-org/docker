#!/bin/sh 
sleep 30

until [ $(pgrep nginx | wc -l)  > 0 ]
do
 echo "Waiting for nginx"
 sleep 2
done
sleep 5

# Standard renewal from 30 days on
certbot renew --noninteractive --nginx --agree-tos
