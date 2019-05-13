#!/bin/bash

pushd /home/$SERVICE_USER/kafka_2.11-$VERSION/bin

# Initialize Cruise Control metric topic
# --zookeeper - zookeeper DNS
# --replication-factor - replication factor of the kafka topic
# --partitions - partitions of the kafka topic
# --topic - name of the kafka topic
./kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 3 --topic __CruiseControlMetrics

# Insert more topic below

popd
