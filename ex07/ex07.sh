#!/bin/bash
# Problema 7
# Sterge din directorul curent toate fisierele care au extensia primita
# ca parametru. Accepta mai multe extensii deodata.

if [ "$#" -eq 0 ]; then
    echo "Utilizare: $0 extensie [extensie ...]" >&2
    exit 1
fi

for extensie in "$@"; do
    extensie=${extensie#.}
    for fisier in *."$extensie"; do
        [ -f "$fisier" ] && rm -f -- "$fisier"
    done
done
