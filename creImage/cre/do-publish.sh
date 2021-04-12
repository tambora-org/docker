#!/bin/bash

#https://wlanboy.com/tutorial/rabbitmq-bash/

amqp-publish --server=172.18.0.4 --port=15672 --username="a-user" --password="a-pa$$w0rd" -e "amq.topic" -r "worker1" -b "this is a test message"
