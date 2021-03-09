#! /bin/bash

echo  '------creating a cloudformation stack for our app------'
sudo docker compose  -f docker-compose-aws.yml up
