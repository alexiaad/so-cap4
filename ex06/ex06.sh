#!/bin/bash
# Problema 6
# Pentru fiecare fisier din directorul curent care contine cel putin unul
# dintre argumentele din linia de comanda, se cere executia uneia dintre:
#   t - tiparire   d - stergere   c - compilare (produce fisiere temporare *.o)
#   a - afisare informatii        i - ignorare
# Daca fisierul curent este director, la cererea utilizatorului scriptul
# se apeleaza recursiv pentru acel director.
# La terminare, folosind trap, nu se lasa in urma niciun fisier temporar.

if [ "$#" -eq 0 ]; then
    echo "Utilizare: $0 argument [argument ...]" >&2
    exit 1
fi

temp_dir=$(mktemp -d)
curatare() {
    rm -rf -- "$temp_dir"
}
trap 'curatare; exit 130' 2
trap 'curatare' 0

proceseaza_director() {
    director=$1
    shift

    cd -- "$director" || return
    for fisier in *; do
        [ -e "$fisier" ] || continue

        if [ -d "$fisier" ]; then
            if [ -f "$fisier" ]; then
                continue
            fi
            printf "Director: %s; recursiv? (d/n): " "$fisier"
            read -r raspuns
            if [ "$raspuns" = "d" ] || [ "$raspuns" = "y" ]; then
                proceseaza_director "$fisier" "$@"
            fi
            continue
        fi

        [ -f "$fisier" ] || continue
        potrivire=0
        for argument in "$@"; do
            if grep -Fq -- "$argument" "$fisier" 2>/dev/null; then
                potrivire=1
                break
            fi
        done
        [ "$potrivire" -eq 1 ] || continue

        printf "Fisier: %s; actiune (t/d/c/a/i): " "$fisier"
        read -r actiune
        case "$actiune" in
            t)
                if command -v lp >/dev/null 2>&1; then
                    lp "$fisier"
                elif command -v lpr >/dev/null 2>&1; then
                    lpr "$fisier"
                else
                    cat -- "$fisier"
                fi
                ;;
            d) rm -f -- "$fisier" ;;
            c)
                este_c=0
                case "$fisier" in
                    *.c) este_c=1 ;;
                esac
                if command -v gcc >/dev/null 2>&1 && [ "$este_c" -eq 1 ]; then
                    fisier_o="$temp_dir/$(basename "$fisier" .c).o"
                    gcc -c "$fisier" -o "$fisier_o"
                    echo "Fisier obiect creat: $fisier_o"
                else
                    echo "Compilarea necesita gcc si un fisier .c."
                fi
                ;;
            a) ls -l -- "$fisier"; file -- "$fisier" 2>/dev/null || true ;;
            i) ;;
            *) echo "Actiune necunoscuta; fisier ignorat." ;;
        esac
    done
    cd .. || return
}

proceseaza_director "$(pwd)" "$@"
