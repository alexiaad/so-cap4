/*
 * Problema 2 - programul OPTIUNE
 * Creati un program "OPTIUNE" care returneaza una din valorile: 0, 1, 2, 3.
 * Compilare: gcc OPTIUNE.c -o OPTIUNE
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char *argv[])
{
    int optiune;

    if (argc == 2) {
        char *final;
        optiune = (int)strtol(argv[1], &final, 10);
        if (*argv[1] == '\0' || *final != '\0' || optiune < 0 || optiune > 3) {
            fprintf(stderr, "OPTIUNE: argumentul trebuie sa fie 0, 1, 2 sau 3.\n");
            return 1;
        }
    } else {
        srand((unsigned int)time(NULL));
        optiune = rand() % 4;
    }

    return optiune;
}
