#!/bin/bash

# MAJ index des packet dispo
sudo apt-get update -yq

# Ajout des packet necessaire pour l'ajout du référentiel docker
sudo apt-get install -yq \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Ajouter la clé officielle GPG de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Ajout du référenciel stable Docker CE
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Installation de Docker CE
sudo apt-get update -yq
sudo apt-get install -yq docker-ce docker-ce-cli containerd.io

# config pour utiliser la commande docker sans utiliser sudo
sudo groupadd docker
sudo usermod -aG docker $USER

