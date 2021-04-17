#!/bin/bash
# Current Container Name : {{ $CurrentContainer.Name }}


#https://wlanboy.com/tutorial/rabbitmq-bash/

# amqp-consume -s 127.0.0.1:5672 -q "test" -e "amq.topic" --vhost "/" -r "worker1" --username=guest --password=guest -d ~/onmessage.sh


initQueue='{"exchange":"cre.default", "binding":"cre.image.demo", "queue":"cre.image.show"}'
 
#amqp-publish --server=172.18.0.4 --port=5672 --username="testuser" --password="secret" -e "cre.swamp" -r "cre.horse" -b "$initQueue"
amqp-publish --url=amqp://admin:secret@172.18.0.4:5672 -e "cre.swamp" -r "cre.horse" -b "$initQueue"

sleep 1

amqp-consume --url=amqp://admin:secret@172.18.0.4:5672 -e "cre.default" -q "cre.image.show" -r "cre.image.demo" -d /cre/show-message.sh


