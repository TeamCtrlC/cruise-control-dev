#!/bin/bash

pushd /home/$SERVICE_USER/cruise-control

# Start cruise-control; arg1 - property file arg2 - cruisecontrol port
./kafka-cruise-control-start.sh /cruisecontrol.properties 8090

popd
