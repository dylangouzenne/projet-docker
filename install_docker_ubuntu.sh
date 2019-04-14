#!/bin/bash

# MAJ index des packet dispo
echo -e '\033[1;33;40mMAJ index des packet dispo\033[0m'
sudo apt-get update -yq

# Ajout des packet necessaire pour l'ajout du référentiel docker
echo -e "\033[1;33;40mAjout des packet necessaire pour l'ajout du référentiel docker\033[0m"
sudo apt-get install -yq \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Ajouter la clé officielle GPG de Docker
echo -e '\033[1;33;40mAjouter la clé officielle GPG de Docker\033[0m'
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Ajout du référenciel stable Docker CE
echo -e '\033[1;33;40mAjout du référenciel stable Docker CE\033[0m'
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Installation de Docker CE
echo -e '\033[1;33;40mInstallation de Docker CE\033[0m'
sudo apt-get update -yq
sudo apt-get install -yq docker-ce docker-ce-cli containerd.io
d_v=$(docker --version)
echo -e '\033[1;32;40mInstallation de Docker réussi : '$d_v'\033[0m'

# Installation de Docker Compose
echo -e '\033[1;33;40mInstallation de Docker Compose\033[0m'
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
c_v=$(docker-compose --version)
echo -e '\033[1;32;40mInstallation de Docker-Compose réussi : '$c_v'\033[0m'

# Config pour utiliser la commande docker sans utiliser sudo
echo -e '\033[1;33;40mConfig pour utiliser la commande docker sans utiliser sudo\033[0m'
sudo usermod -aG docker $USER

# Redémarer la machine pour appliquer l'ajout de l'user au groupe docker
echo -en '\033[1;31;40mVoulez vous redémarer le système pour appliquer les mise a jour Y/N : \033[0m'
read ouinon
if [ "$ouinon" = "y" ] || [ "$ouinon" = "Y" ]; then
    echo -e '\033[1;33;40mRedémarage du système\033[0m'
    sleep 3
    sudo shutdown now -r
elif [ "$ouinon" = "n" ] || [ "$ouinon" = "N" ]; then
    echo "Ok, bye!"
    exit
else
    echo "Il falait taper Y ou N ! mais pas grave bye"
    exit
fi