#!/bin/sh 
RANDOM=$$
# RANDOM 32767 max: 10-40 sec
# run async
sleep $(echo "0.1*(100.0+$RANDOM % 300.0)" | bc)
#i.e. /cre/www/tambora/yii run-cron-jobs
echo "Php Nginx 30 minutes cron"
