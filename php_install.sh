#!/bin/bash

# Mettre à jour les informations des paquets
sudo apt update

# Installer PHP et les modules nécessaires
sudo apt install php libapache2-mod-php php-mysql php-cli php-json php-common php-mbstring php-zip php-gd php-xml php-curl php-xmlrpc

# Vérifier la version installée
php -v

# Activer le module PHP dans Apache
sudo systemctl restart apache2

# phpMyAdmin

# Mettre à jour les informations des paquets
sudo apt update

# Installer phpMyAdmin et les dépendances
sudo apt install phpmyadmin php-mbstring php-gettext

# Sélectionnez Apache comme serveur web lors de la configuration et choisissez "yes" lorsque vous êtes invité à configurer la base de données avec dbconfig-common.

# Activer l'extension PHP nécessaire pour phpMyAdmin
sudo phpenmod mbstring

# Redémarrer le serveur Apache
sudo systemctl restart apache2

# Ajouter phpMyAdmin au fichier de configuration Apache
echo "Include /etc/phpmyadmin/apache.conf" | sudo tee -a /etc/apache2/apache2.conf

# Redémarrer à nouveau le serveur Apache
sudo systemctl restart apache2

sudo systemctl restart mysql
