#!/bin/bash

docker rmi vic.tpm.com/elk/mylogstash

build=$(docker build . -q)
if [ $? -eq 0 ]; then
    echo "Image $build created"
else
    echo "Image not created!  Please check!!"
    exit 1
fi

image_id=$(docker images -q | cut -d$'\n' -f1)
re=$(docker tag $image_id vic.tpm.com/elk/mylogstash)
if [ $? -eq 0 ]; then
    echo "Image $image_id tagged"
else
    echo "Image not tagged! Please check!!"
    exit 1
fi

docker push vic.tpm.com/elk/mylogstash
if [ $? -eq 0 ]; then
    echo "Image Pushed"
else
    echo "Image not Pushed! Please check!!"
    exit 1
fi
