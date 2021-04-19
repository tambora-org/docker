#!/bin/bash
#https://wlanboy.com/tutorial/rabbitmq-bash/


#initQueue='{"exchange":"cre.default", "binding":"cre.image.demo", "queue":"cre.image.show"}'
 
#amqp-publish --url=amqp://admin:secret@172.18.0.4:5672 -e "cre.swamp" -r "cre.horse" -b "$initQueue"
/cre/create-queue.sh -e "cre.default" -q "cre.image.show" -b "cre.image.demo"

sleep 1

#amqp-consume --url=amqp://admin:secret@172.18.0.4:5672 -e "cre.default" -q "cre.image.show" -r "cre.image.demo" -d /cre/show-message.sh
/cre/consume-queue.sh -e "cre.default" -q "cre.image.show" -b "cre.image.demo" -d /cre/show-message.sh

