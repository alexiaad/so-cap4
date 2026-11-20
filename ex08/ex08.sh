#!/bin/bash
# Problema 8
# Primeste ca parametru o extensie si afiseaza toate fisierele care au
# extensia identica cu cea primita.

if [ "$#" -ne 1 ]; then
    echo "Utilizare: $0 extensie" >&2
    exit 1
fi

extensie=${1#.}
found=0
for fisier in *."$extensie"; do
    if [ -f "$fisier" ]; then
        echo "$fisier"
        found=1
    fi
done
if [ "$found" -eq 0 ]; then
    echo "Nu exista fisiere cu extensia .$extensie."
fi
