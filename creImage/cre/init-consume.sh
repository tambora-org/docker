#!/bin/bash
#https://wlanboy.com/tutorial/rabbitmq-bash/

sleep 5
/cre/create-queue.sh -e "cre.default" -q "cre.image.show" -b "cre.image.demo"

sleep 1
/cre/consume-queue.sh -e "cre.default" -q "cre.image.show" -b "cre.image.demo" -s /cre/show-message.sh

