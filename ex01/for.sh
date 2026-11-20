#!/bin/bash
# Problema 1 - directiva for
# Testati for pe o lista de fisiere (*.txt) si pe parametrii scriptului.

echo "Parametrii scriptului:"
for param in "$@"; do
    echo "  $param"
done

echo "Fisierele .txt din directorul curent:"
found=0
for fisier in *.txt; do
    if [ -f "$fisier" ]; then
        echo "  $fisier"
        found=1
    fi
done
if [ "$found" -eq 0 ]; then
    echo "  (niciun fisier)"
fi
