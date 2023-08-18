#!/bin/bash

# Vérifier si Node.js est installé
if ! [ -x "$(command -v node)" ]; then
  echo "Node.js n'est pas installé. Exécutez d'abord le script d'installation de Node.js."
  exit 1
fi

# Vérifier si npm est déjà installé
if [ -x "$(command -v npm)" ]; then
  echo "npm est déjà installé."
else
  # Installer npm
  sudo apt update
  sudo apt install npm

  # Vérifier la version installée
  npm -v
fi
