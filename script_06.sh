#!/bin/bash
clear

#---->Explicación 22
if [ $# != 2 ]; then
    echo -e "\033[1;91mNúmero de argumentos incorrecto\033[0m"
    exit
fi

#---->Explicación 23
if [ ! -f "$1/$2" ]; then
    echo -e "\033[1;91mEl archivo\033[0m \033[1;97m$2 \033[1;91mno existe en el direcorio\033[0m \033[1;97m$1 \033[0m"
    exit
fi

read -p "¿Quieres acceder al contenido del archivo (s/n)? " RESPUESTA

#---->Explicación 24
if [ $RESPUESTA == "s" ]; then
    if [ ! -d "$1/$2" ]; then
        cat "$1/$2"
    else
        echo -e "\033[1;97m$2 \033[1;91mes un directorio, no un archivo\033[0m"
        exit
    fi
fi
exit 0
