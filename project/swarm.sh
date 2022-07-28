#!/bin/bash

# to start docker swarm
docker swarm init

# to deploy swarm.yml
docker stack deploy -c swarm.yml go-micro

# to see running services
docker service ls

# to scale services
docker service scale go-micro_logger-service=2

# update service with a new image

# build with new tag
docker build -f logger-service.dockerfile -t bindian0509/logger-service:1.0.1 .

# push the tag to hub
docker push bindian0509/logger-service:1.0.1

# update a scaled upto 2 instances service to hane no downtime
docker service update --image bindian0509/logger-service:1.0.1 go-mi_logger-service

# burn down everything to ground and run
docker stack rm go-micro
docker swarm leave --force


