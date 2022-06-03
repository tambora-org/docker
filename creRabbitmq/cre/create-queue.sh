#!/bin/bash

read line
echo "Message: $line"

#initQueue='{"exchange":"cre.default", "binding":"cre.image.demo", "queue":"cre.image.show"}'

exchange=$(echo $line | jq -r '.exchange' )
binding=$(echo $line | jq -r '.binding' )
queue=$(echo $line | jq -r '.queue' )

/etc/rabbitmq/rabbitmqadmin declare exchange name=$exchange type=direct  durable=false auto_delete=true
/etc/rabbitmq/rabbitmqadmin declare queue name=$queue durable=false auto_delete=true
/etc/rabbitmq/rabbitmqadmin declare binding source=$exchange destination=$queue routing_key=$binding 
 

