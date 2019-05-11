#!/bin/bash

pushd zookeeper
docker build -t ctrl-c:cc-kafka .
popd
