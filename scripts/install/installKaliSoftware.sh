#!/bin/bash

set -euo pipefail

DIR_ME=$(realpath $(dirname $0))
. ${DIR_ME}/.installUtils.sh
setUserName "$(whoami)"

#bash ${DIR_ME}/../config/system/prepareXServer.sh ${USERNAME}

#sudo apt install -y kali-win-kex

#echo -e "\n\nInstalling OpenVSCode Server"
#bash ${DIR_ME}/installOpenVSCodeServer.sh
#
echo -e "\n\nInstalling docker & docker-compose"
bash ${DIR_ME}/installDockerKali.sh
sudo usermod -aG docker ${USERNAME}
#
echo -e "\n\nInstalling Kali Headless Metapackage via apt..."
bash ${DIR_ME}/installKaliHeadless.sh
#
echo -e "\n\nInstalling Kali Forensic Tools Metapackage via apt..."
bash ${DIR_ME}/installKaliForensic.sh
#
#echo -e "\n\nInstalling Gradle manually..."
#bash ${DIR_ME}/installGradle.sh
#
#echo -e "\n\nInstalling node.js via n..."
#bash ${DIR_ME}/installNodejs.sh
#
#echo -e "\n\nInstalling rust..."
#bash ${DIR_ME}/installRust.sh
#
#echo -e "\n\nInstalling deno..."
#bash ${DIR_ME}/installDeno.sh
#
#echo -e "\n\nInstalling Google Chrome..."
#bash ${DIR_ME}/installChrome.sh
#
#echo -e "\n\nInstalling KVM & QEMU..."
#bash ${DIR_ME}/installKvm.sh

#sudo apt install -y kali-linux-headless

# clean-up
sudo apt -y autoremove

#bash ${DIR_ME}/../report/listVersions.sh
