#!/bin/bash

for id in $(docker ps -q)
do
    if [[ $(docker port "${id}") == *"${1}"* ]]; then
        echo "stopping container ${id}"
        docker stop "${id}"
        echo "collecting running container's image id"
        cont-image=$(docker container inspect "${id}" --format '{{.Image}}')
        echo "Image id is - $cont-image"
        echo "Removing container"
        docker rm -vf "${id}"
        echo "Removing image id $cont-image"
        docker rmi -f $cont-image
        echo "Finish"
    fi
done
