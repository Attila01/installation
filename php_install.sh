#!/bin/bash

# Mettre à jour les informations des paquets
sudo apt update

# Installer PHP et les modules nécessaires
sudo apt install php libapache2-mod-php php-mysql php-cli php-json php-common php-mbstring php-zip php-gd php-xml php-curl php-xmlrpc

# Vérifier la version installée
php -v

# Activer le module PHP dans Apache
sudo systemctl restart apache2
