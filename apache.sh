#!/bin/bash

# Mettre à jour les informations des paquets
sudo apt update

# Installer Apache
sudo apt install apache2

# Démarrer le service Apache
sudo systemctl start apache2

# Configurer Apache pour démarrer automatiquement au démarrage du système
sudo systemctl enable apache2

# Activer le pare-feu pour Apache
sudo ufw allow 'Apache Full'

# Vérifier le statut d'Apache
sudo systemctl status apache2
