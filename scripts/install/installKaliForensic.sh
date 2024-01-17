#!/bin/bash

set -euo pipefail
DIR_ME=$(realpath $(dirname $0))

sudo apt-get update
sudo apt-get install -y kali-tools-forensics
