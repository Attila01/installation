#!/bin/bash

# Mettre à jour les informations des paquets
sudo apt update

# Installer PostgreSQL
sudo apt install postgresql postgresql-contrib

# Démarrer le service PostgreSQL
sudo systemctl start postgresql

# Configurer PostgreSQL pour démarrer automatiquement au démarrage du système
sudo systemctl enable postgresql

# Créer un nouvel utilisateur PostgreSQL
POSTGRES_USER="nouvel_utilisateur"
POSTGRES_PASSWORD="mot_de_passe_utilisateur"
sudo -u postgres psql -c "CREATE USER $POSTGRES_USER WITH PASSWORD '$POSTGRES_PASSWORD';"

# Créer une base de données pour le nouvel utilisateur
POSTGRES_DB="nouvelle_base_de_donnees"
sudo -u postgres psql -c "CREATE DATABASE $POSTGRES_DB OWNER $POSTGRES_USER;"

# Activer l'authentification par mot de passe dans PostgreSQL
sudo sed -i "s/local\s*all\s*all\s*peer/local all all md5/g" /etc/postgresql/*/main/pg_hba.conf
sudo systemctl restart postgresql
