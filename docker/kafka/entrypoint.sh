#!/bin/bash

sed -i "/broker.id=/ s/=.*/=$BROKER_ID/" /server.properties

cd kafka_2.11-$KAFKA_VERSION; bin/kafka-server-start.sh /server.properties
