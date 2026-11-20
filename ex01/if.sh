#!/bin/bash
# Problema 1 - directiva if (si comanda test / [ ])
# Testati if, elif, else.

val=${1:-}

if [ -z "$val" ]; then
    echo "Nu a fost dat niciun parametru."
elif [ "$val" -gt 0 ] 2>/dev/null; then
    echo "Valoarea $val este pozitiva."
elif [ "$val" -lt 0 ] 2>/dev/null; then
    echo "Valoarea $val este negativa."
else
    echo "Valoarea $val nu este un numar intreg."
fi
