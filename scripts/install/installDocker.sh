#!/bin/bash

set -euo pipefail
DIR_ME=$(realpath $(dirname $0))

#sudo apt update
#sudo apt remove docker docker.io containerd runc
#sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
#
#sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
##sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
## APT variable to prevent script waiting for user to hit "ENTER"
#sudo DEBIAN_FRONTEND=noninteractive add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
#sudo apt update
#sudo apt install -y --no-install-recommends docker-ce

## From Docker website
#sudo apt-get update
#sudo apt-get install -y ca-certificates curl gnupg
#sudo install -m 0755 -d /etc/apt/keyrings
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
#sudo chmod a+r /etc/apt/keyrings/docker.gpg
#
## Add the repository to Apt sources:
#echo \
#  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
#  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
#  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
#sudo apt-get update
#
#sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
##

#VERSION_DOCKER_COMPOSE="v2.1.1"
#if [[ ! -d ~/.docker/cli-plugins ]]; then
#  mkdir -p ~/.docker/cli-plugins
#fi
#curl -fSL https://github.com/docker/compose/releases/download/${VERSION_DOCKER_COMPOSE}/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
#chmod +x ~/.docker/cli-plugins/docker-compose

# Docker won't run under this for some reason