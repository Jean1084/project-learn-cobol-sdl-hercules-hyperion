#!/bin/bash

# Activer le mode strict
set -euo pipefail

# Fonction pour afficher les messages
log() {
    echo -e "\e[1;34m[INFO]\e[0m $1"
}

error() {
    echo -e "\e[1;31m[ERROR]\e[0m $1" >&2
    exit 1
}

# Vérifier si Vagrant est installé
if ! command -v vagrant &> /dev/null; then
    error "Vagrant n'est pas installé. Veuillez l'installer avant d'exécuter ce script."
fi

# Arrêter la VM si elle est en cours d'exécution
log "Arrêt de la VM Vagrant..."
vagrant halt || log "La VM est déjà arrêtée."

# Supprimer la VM
log "Suppression de la VM Vagrant..."
vagrant destroy -f || log "La VM est déjà supprimée."

# Récupérer la liste des boxes installées
log "Récupération des boxes Vagrant..."
BOXES=$(vagrant box list | awk '{print $1}')

if [[ -z "$BOXES" ]]; then
    log "Aucune box Vagrant trouvée."
else
    for BOX in $BOXES; do
        log "Suppression de la box Vagrant: $BOX..."
        vagrant box remove "$BOX" || log "La box $BOX est déjà supprimée."
    done
fi

# Supprimer le dossier `.vagrant`
if [[ -d ".vagrant" ]]; then
    log "Suppression du dossier .vagrant..."
    rm -rf .vagrant
else
    log "Le dossier .vagrant n'existe pas."
fi

log "Nettoyage terminé avec succès."

# Supprimer les caches de VirtualBox
log "Supprimer les caches de VirtualBox...."
rm -rf ~/.VirtualBox
rm -rf ~/.config/VirtualBox
rm -rf ~/.cache/VirtualBox
rm -rf ~/VirtualBox\ VMs/
rm -rf ~/.config/VirtualBox/Extensions