#!/bin/bash

# Mettre à jour les informations des paquets
sudo apt update

# Installer curl pour télécharger les binaires Node.js
sudo apt install curl

# Télécharger et exécuter le script d'installation de Node.js
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -

# Installer Node.js et npm
sudo apt install nodejs

# Vérifier les versions installées
node -v
npm -v
