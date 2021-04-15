#!/bin/bash
 
echo "initialize rabbitmq server"

rabbitmqctl await_startup

echo "rabbitmq server running"

#munchausen-swamp
rabbitmqadmin declare exchange name="cre.swamp" type=direct
rabbitmqadmin declare queue name="cre.munchausen" durable=false
rabbitmqadmin declare binding source="cre.swamp" destination="cre.munchausen" routing_key="cre.horse" 
## [destination_type=... arguments=...]

amqp-consume -q "cre.swamp" -e "cre.munchausen" --vhost "/" -r "cre.horse" -d ./show-message.sh

