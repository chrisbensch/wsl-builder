#!/bin/bash

set -euo pipefail
DIR_ME=$(realpath $(dirname $0))

## From Kali Docs
sudo apt-get update
sudo apt-get install -y docker.io

## Latest Docker Compose
VERSION_DOCKER_COMPOSE=$(curl -I https://github.com/docker/compose/releases/latest | awk -F '/' '/^location/ {print  substr($NF, 1, length($NF)-1)}')
sudo curl -fSL https://github.com/docker/compose/releases/download/${VERSION_DOCKER_COMPOSE}/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Docker stopped on boot
sudo systemctl disable docker.socket
sudo systemctl disable docker

## Docker start on boot
#sudo systemctl enable docker
#sudo systemctl start docker

