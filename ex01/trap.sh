#!/bin/bash
# Problema 1 - redirectarea intreruperilor cu trap
# Testati ce se intampla la Ctrl+C (semnalul 2) si la iesire (0).

temp_fisier=$(mktemp)

curatare() {
    rm -f "$temp_fisier"
    echo "S-a executat curatarea."
}

trap 'echo "A fost intrerupt scriptul (SIGINT)."; curatare; exit 130' 2
trap 'curatare' 0

echo "Fisier temporar: $temp_fisier"
echo "Apasati Ctrl+C pentru a testa semnalul sau asteptati..."
sleep 5
echo "Scriptul s-a terminat normal."
