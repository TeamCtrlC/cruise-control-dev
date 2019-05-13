#!/bin/bash

pushd /home/$SERVICE_USER/kafka_2.11-$VERSION

# Start ZK server; arg1 - zk runtime property file
bin/zookeeper-server-start.sh config/zookeeper.properties

popd
