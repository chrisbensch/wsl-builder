#!/bin/bash

set -euo pipefail

sudo apt --fix-broken install -y
sudo apt install -y fonts-liberation xdg-utils wget libgbm1

if [[ $(which google-chrome | wc -l) == 0 ]]; then
    curl -fSL https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o /tmp/google-chrome-stable_current_amd64.deb
    #sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb
    # Will replace all dpkg installs for smarter apt-based, generally helps ensure package reqs are met
    sudo apt install -y /tmp/google-chrome-stable_current_amd64.deb
    rm /tmp/google-chrome-stable_current_amd64.deb
fi
