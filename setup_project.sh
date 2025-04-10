#!/bin/bash

set -e

WHOAMI="vagrant"

echo "Mise à jour du système..."
sudo apt update && sudo apt upgrade -y

echo "Installation des dépendances sudo apt..."
sudo apt install -y build-essential curl wget unzip git gnucobol

echo "GnuCOBOL installé ! Version :"
cobc --version

sudo apt-get update && sudo apt-get upgrade -y

echo "Installation des dépendances sudo apt-get..."
sudo apt-get -y install time cmake flex gawk m4
sudo apt-get -y install autoconf automake libtool-bin libltdl-dev
sudo apt-get -y install libbz2-dev zlib1g-dev
sudo apt-get -y install libcap2-bin


#sudo git clone https://github.com/ibm3270/mvs38j-turnkey.git mvs38j
# sudo git clone https://github.com/pmattes/x3270.git mvs38j
# sudo git clone https://github.com/SDL-Hercules-390/mvs38j-turnkey.git mvs38j
#sudo git clone https://github.com/SDL-Hercules-390/hyperion.git mvs38j
#sudo chown -R $WHOAMI:$WHOAMI /opt/mvs38j
#
#echo "Création du script de lancement pour Hercules..."
#cat <<EOF | sudo tee /usr/local/bin/start_hercules.sh
##!/bin/bash
#cd /opt/mvs38j
#hercules -f conf/tk4-.cnf
#EOF

#sudo chmod +x /usr/local/bin/start_hercules.sh

echo "Tentative de récupération de l'IP de la VM (enp0s8)..."
IP_ADDRESS=$(ip -f inet addr show enp0s8 2>/dev/null | sed -En -e 's/.*inet ([0-9.]+).*/\1/p')
echo "IP détectée : ${IP_ADDRESS:-Non disponible}"

echo "Installation terminée."
echo "Connecte-toi avec 'vagrant ssh' et exécute : start_hercules.sh"