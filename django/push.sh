#! /bin/bash

REGION='ap-south-1'
AWS_ACCOUNT_ID='568056480524'

echo '-----generatig authentication token-----'
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com

echo '-----building docker image------------'
docker --context default build -f ./django/sampleApp/nginx/Dockerfile 

echo '-----adding tag to image------------'
docker tag django_nginx:2.0 $AWS_ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/django_nginx:2.0

echo '-----pushing docker image to ecr------------'
docker push $AWS_ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/django_nginx:2.0

echo '-----building docker image------------'
docker --context default build -f ./django/Dockerfile

echo '-----adding tag to image------------'
docker tag sampleapp:2.0 $AWS_ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/sampleapp:2.0

echo '-----pushing docker image to ecr------------'
docker push $AWS_ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/django_nginx:2.0



