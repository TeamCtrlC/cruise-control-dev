#!/bin/bash

OP=$1
SRC_PATH=$2
CC_TEMP_PATH=$(pwd)/docker/base/tmp

function help() {
    echo "Usage: ./dev.sh <options> [source-path]"
}

if [[ $OP = "build" ]]; then
    pushd docker
        # Build base image
        if [[ -d "$SRC_PATH" ]]; then
            cp -vr $SRC_PATH $CC_TEMP_PATH
            docker build -t ctrl-c:cc-base base && docker-compose build
            rm -rf $CC_TEMP_PATH
        else
            echo "ERROR: Please specify a valid build path."
        fi
    popd
elif [[ $OP = "up" ]]; then
    pushd docker
        docker-compose up $2
    popd
elif [[ $OP = "down" ]]; then
    pushd docker
        docker-compose down
    popd
else
    echo "ERROR: Unrecognized option"
fi
