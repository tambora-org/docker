#!/bin/bash

#https://wlanboy.com/tutorial/rabbitmq-bash/

#amqp-publish --url=amqp://admin:secret@172.18.0.4:5672 -e "cre.default" -r "cre.image.demo" -b "this is a test message"

/cre/mq/publish-queue.sh -e "cre.default" -b "cre.image.demo" -m "this is a test message"
