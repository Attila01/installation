#!/bin/bash

# Mettre à jour les informations des paquets
sudo apt update

# Installer les dépendances requises
sudo apt install curl php-cli php-zip unzip

# Télécharger et installer Composer
curl -sS https://getcomposer.org/installer -o composer-setup.php
HASH="$(curl -sS https://composer.github.io/installer.sig)"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# Supprimer le fichier d'installation
rm composer-setup.php

# Vérifier la version installée
composer --version
