#!/bin/bash

# Assign broker ID
sed -i "/broker.id=/ s/=.*/=$BROKER_ID/" /server.properties

pushd /home/$SERVICE_USER/kafka-current/bin

# Start kafka server; Arg1 - kafka server runtime properties
./kafka-server-start.sh /server.properties

popd
