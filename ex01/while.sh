#!/bin/bash
# Problema 1 - directiva while (si citirea cu read)

echo "Scrieti cuvinte (STOP pentru terminare):"
while read -r cuvant; do
    [ "$cuvant" = "STOP" ] && break
    echo "Ati introdus: $cuvant"
done
