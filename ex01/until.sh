#!/bin/bash
# Problema 1 - directiva until

n=1
until [ "$n" -gt 5 ]; do
    echo "Iteratia $n"
    n=$((n + 1))
done
