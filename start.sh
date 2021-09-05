#!/bin/bash

docker run -d --name ubuntu pycontribs/ubuntu sleep 9099999
docker run -d --name centos7 pycontribs/centos:7 sleep 9099999
docker run -d --name fedora pycontribs/fedora sleep 9099999

ansible-playbook -i inventory/prod.yml site.yml --vault-password-file secret.pwd

docker stop $(docker ps -q)
docker rm $(docker ps -aq)