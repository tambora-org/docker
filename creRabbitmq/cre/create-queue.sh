#!/bin/bash

read line
echo "Message: $line"

#initQueue='{"exchange":"cre.default", "binding":"cre.image.demo", "queue":"cre.image.show"}'

exchange=$(echo $line | jq '.exchange' | tr -d '"')
binding=$(echo $line | jq '.binding' | tr -d '"')
queue=$(echo $line | jq '.queue' | tr -d '"')

rabbitmqadmin declare exchange name=$exchange type=direct  durable=false auto_delete=true
rabbitmqadmin declare queue name=$queue durable=false auto_delete=true
rabbitmqadmin declare binding source=$exchange destination=$queue routing_key=$binding 
 

