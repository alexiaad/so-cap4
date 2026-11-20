#!/bin/bash
# Problema 1 - directiva case
# Testati case cu mai multe tipare si tiparul implicit *.

case "${1:-}" in
    a|A)
        echo "Ati ales litera a."
        ;;
    [0-9])
        echo "Ati introdus o cifra."
        ;;
    *.txt)
        echo "Ati introdus un nume cu extensia txt."
        ;;
    "")
        echo "Nu a fost dat niciun argument."
        ;;
    *)
        echo "Argumentul nu corespunde niciunui tipar cunoscut."
        ;;
esac
