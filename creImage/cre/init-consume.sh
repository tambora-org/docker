#!/bin/bash
# Current Container Name : {{ $CurrentContainer.Name }}


#https://wlanboy.com/tutorial/rabbitmq-bash/

# amqp-consume -s 127.0.0.1:5672 -q "test" -e "amq.topic" --vhost "/" -r "worker1" --username=guest --password=guest -d ~/onmessage.sh


initQueue="{'exchange':'cre.default', 'binding':'cre.image.demo', 'queue':'cre.image.show'}"
 
amqp-publish --server=172.18.0.4 --port=5672 --username="testuser" --password="secret" -e "cre.swamp" -r "cre.horse" -b "$initQueue"

amqp-consume --server=172.18.0.4 --port=5672 --username="testuser" --password="secret" -e "cre.default" -q "cre.image.show"  --vhost "/" -r "cre.image.demo" -d ./show-message.sh



#amqp-publish --server=172.18.0.4 --port=5672 --username="a-user" --password="a-pa$$w0rd" -e "amq.topic" -r "worker1" -b "this is a test message"
