#!/bin/bash

cd kafka_2.11-$VERSION; bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 3 --topic __CruiseControlMetrics
