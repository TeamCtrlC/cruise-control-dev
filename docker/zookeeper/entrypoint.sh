#!/bin/bash

pushd /home/$SERVICE_USER/kafka-current

# Start ZK server; arg1 - zk runtime property file
bin/zookeeper-server-start.sh config/zookeeper.properties

popd
