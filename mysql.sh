#!/bin/bash

# Mettre à jour les informations des paquets
sudo apt update

# Installer MySQL Server
sudo apt install mysql-server

# Démarrer le service MySQL
sudo systemctl start mysql

# Exécuter le script de sécurité MySQL
sudo mysql_secure_installation

# Configurer MySQL pour démarrer automatiquement au démarrage du système
sudo systemctl enable mysql

# Réinitialiser le mot de passe root de MySQL
MYSQL_ROOT_PASSWORD="votre_mot_de_passe_root"
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$MYSQL_ROOT_PASSWORD';"

# Créer un nouvel utilisateur MySQL
MYSQL_USER="nouvel_utilisateur"
MYSQL_USER_PASSWORD="mot_de_passe_utilisateur"
sudo mysql -e "CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_USER_PASSWORD';"
sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'localhost' WITH GRANT OPTION;"

# Redémarrer MySQL
sudo systemctl restart mysql

# Vérifier si phpMyAdmin est déjà installé
if [ -f /etc/phpmyadmin/config.inc.php ]; then
    echo "phpMyAdmin est déjà installé."
else
    # Mettre à jour les informations des paquets
    sudo apt update

    # Installer phpMyAdmin et les dépendances
    sudo apt install phpmyadmin php-mbstring php-gettext

    # Sélectionnez Apache comme serveur web lors de la configuration et choisissez "yes" lorsque vous êtes invité à configurer la base de données avec dbconfig-common.

    # Activer l'extension PHP nécessaire pour phpMyAdmin
    sudo phpenmod mbstring

    # Redémarrer le serveur Apache
    sudo systemctl restart apache2

    echo "phpMyAdmin a été installé."
fi
