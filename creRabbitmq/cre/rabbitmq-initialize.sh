#!/bin/bash
 
rabbitmqctl await_startup

#munchausen-swamp
rabbitmqadmin declare exchange name=swamp type=direct
rabbitmqadmin declare queue name=munchausen durable=false
rabbitmqadmin declare binding source=swamp destination=munchausen routing_key=munchausen 
## [destination_type=... arguments=...]

amqp-consume -q "munchausen" -e "swamp" --vhost "/" -r "munchausen" -d ./show-message.sh

