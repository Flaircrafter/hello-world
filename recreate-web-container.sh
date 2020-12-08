#!/bin/bash

for id in $(docker ps -q)
do
    if [[ $(docker port "${id}") == *"${1}"* ]]; then
        echo "stopping container ${id}"
        docker stop "${id}"
        echo "Removing container"
        docker rm -vf "${id}"
        docker rmi -f maven_project:latest
        echo "Finish"
    fi
done
