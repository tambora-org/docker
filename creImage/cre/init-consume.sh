#!/bin/bash

#https://wlanboy.com/tutorial/rabbitmq-bash/

# amqp-consume -s 127.0.0.1:5672 -q "test" -e "amq.topic" --vhost "/" -r "worker1" --username=guest --password=guest -d ~/onmessage.sh

amqp-consume --server=172.18.0.4 --port=5672 --username="a-user" --password="a-pa$$w0rd" -q "test" -e "amq.topic" --vhost "/" -r "worker1" -d ./show-message.sh



#amqp-publish --server=172.18.0.4 --port=5672 --username="a-user" --password="a-pa$$w0rd" -e "amq.topic" -r "worker1" -b "this is a test message"
