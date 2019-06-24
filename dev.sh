#!/bin/bash

OP=$1
SRC_PATH=$2
CC_TEMP_PATH_BASE=$(pwd)/docker/base/tmp
CC_TEMP_PATH_CC=$(pwd)/docker/cruise-control/tmp

function help() {
    echo "Usage: ./dev.sh <options> [source-path]"
    echo "<options>:"
    echo "    build - build service images for zk/kafka/cc"
    echo "    up    - provision the test cluster"
    echo "    down  - destroy the test cluster"
    echo "[source-path]: path to cruise-control source directory"
}

if [[ $OP = "build" ]]; then
    pushd docker
        # Build base image
        if [[ -d "$SRC_PATH" ]]; then
            cp -vpr $SRC_PATH $CC_TEMP_PATH_BASE
            cp -vpr $SRC_PATH $CC_TEMP_PATH_CC
            docker build -t ctrl-c:cc-base base && docker-compose build
            rm -rf $CC_TEMP_PATH_BASE
            rm -rf $CC_TEMP_PATH_CC
        else
            echo "ERROR: Please specify a valid build path."
            echo ""
            help
        fi
    popd
elif [[ $OP = "up" ]]; then
    pushd docker
        docker-compose up -d
    popd
elif [[ $OP = "refresh" ]]; then
    pushd docker
        if [[ -d "$SRC_PATH" ]]; then
            docker-compose rm -sf cruise-control
            cp -vpr $SRC_PATH $CC_TEMP_PATH_CC
            docker-compose build cruise-control
            docker-compose up -d
            rm -rf $CC_TEMP_PATH_CC
        else
            echo "ERROR: Please specify a valid build path."
            echo ""
            help
        fi
    popd
elif [[ $OP = "down" ]]; then
    pushd docker
        docker-compose down
    popd
elif [[ $OP = "-h" ]]; then
    help
else
    echo "ERROR: Unrecognized option"
    echo ""
    help
fi
