#!/bin/bash

# Vérifier si Python est déjà installé
if command -v python3 &>/dev/null; then
    echo "Python est déjà installé."
else
    # Installer Python 3
    sudo apt update
    sudo apt install python3

    # Vérifier la version installée
    python3 --version
fi
