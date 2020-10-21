# Waypoint Sample Configs

## ami-ec2

Build: Finding AMI which runs apache
Deploy: Lauching EC2 with opening 80
Release: Set the ALB and target group to listenc at 80

## dockerfile-k8s
Build: Making the docker container from Dockerfile
Deploy: Deploying to K8s
Release: Releasing K8s `load_balancer`

## dockerpull-k8s
Build: Pulling the existing image from GCR 
Deploy: Deploying to K8s
Release: Releasing K8s `load_balancer`

## google-gcr
Build: Generating the container by Google Buildpacks
Deploy: Deploying & Releasing at Google Cloud Run 

## heroku-nomad
Build: Generating the container by Heroku Buildpacks
Deploy: Deploying & Releasing at Nomad

*`export NOMAD_ADDR='http://34.84.167.230:4646'`* is required before `waypoint deploy`.

## paketo-ecs
Build: Generating the container by Paketo Buildpacks
Deploy: Deploying & Releasing at ECS

## paketo-k8s
Build: Generating the container by Paketo Buildpacks
Deploy: Deploying to K8s
Release: Releasing K8s `load_balancer`