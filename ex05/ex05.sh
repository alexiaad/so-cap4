#!/bin/bash
# Problema 5
# Primeste 13 parametri pe care trebuie sa ii afiseze.

if [ "$#" -ne 13 ]; then
    echo "Eroare: sunt necesari exact 13 parametri (s-au primit $#)." >&2
    exit 1
fi

i=1
for param in "$@"; do
    echo "Parametrul $i: $param"
    i=$((i + 1))
done
