#!/bin/bash

echo "=== Vérification des versions des dépendances installées ==="

# Liste des commandes avec leurs options de version
declare -A commands=(
  [gcc]="gcc --version | head -n 1"
  [g++]="g++ --version | head -n 1"
  [make]="make --version | head -n 1"
  [curl]="curl --version | head -n 1"
  [wget]="wget --version | head -n 1"
  [unzip]="unzip -v | head -n 1"
  [git]="git --version"
  [cobc]="cobc -v | head -n 1"
  [time]="/usr/bin/time --version | head -n 1"
  [cmake]="cmake --version | head -n 1"
  [flex]="flex --version | head -n 1"
  [gawk]="gawk --version | head -n 1"
  [m4]="m4 --version | head -n 1"
  [autoconf]="autoconf --version | head -n 1"
  [automake]="automake --version | head -n 1"
  [libtool]="libtool --version | head -n 1"
  [bzip2]="bzip2 --version 2>&1 | head -n 1"
  [zlib]="dpkg -s zlib1g-dev | grep Version"
  [libcap]="dpkg -s libcap2-bin | grep Version"
)

for cmd in "${!commands[@]}"; do
  echo -n "$cmd: "
  eval "${commands[$cmd]}" || echo "Non trouvé"
done
