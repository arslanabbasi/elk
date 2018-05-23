#!/bin/bash
set -e

docker rmi -f vic.tpm.com/elk/mylogstash:latest

build=$(docker build -t vic.tpm.com/elk/mylogstash . -q)
if [ $? -eq 0 ]; then
    echo "Image $build created"
else
    echo "Image not created!  Please check!!"
fi

#image_id=$(docker images -q | cut -d$'\n' -f1)
# re=$(docker tag $image_id vic.tpm.com/elk/mylogstash)
# if [ $? -eq 0 ]; then
#     echo "Image $image_id tagged"
# else
#     echo "Image not tagged! Please check!!"
#     exit 1
# fi

docker images

docker push vic.tpm.com/elk/mylogstash
if [ $? -eq 0 ]; then
    echo "Image Pushed"
else
    echo "Image not Pushed! Please check!!"
    exit 1
fi
