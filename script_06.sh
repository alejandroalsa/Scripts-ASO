#!/bin/bash
clear

function ayuda() {
  echo "Este script accede al contenido de un archivo en un directorio específico."
  echo "Uso: $0 directorio archivo"
  echo "  directorio: Ruta absoluta o relativa del directorio que contiene el archivo."
  echo "  archivo: Nombre del archivo del que se quiere acceder al contenido."
  echo "Ejemplo: $0 /home/user/ documentos/nota.txt"
  exit 1
}

#---->Explicación 22
if [ $# != 2 ]; then
    echo -e "\033[1;91mNúmero de argumentos incorrecto\033[0m"
    ayuda 
    exit 1
fi

#---->Explicación 23
if [ ! -f "$1/$2" ]; then
    echo -e "\033[1;91mEl archivo\033[0m \033[1;97m$2 \033[1;91mno existe en el direcorio\033[0m \033[1;97m$1 \033[0m"
    ayuda
    exit 1
fi

read -p "¿Quieres acceder al contenido del archivo (s/n)? " RESPUESTA

#---->Explicación 24
if [ $RESPUESTA == "s" ]; then
    if [ ! -d "$1/$2" ]; then
        cat "$1/$2"
    else
        echo -e "\033[1;97m$2 \033[1;91mes un directorio, no un archivo\033[0m"
        ayuda
        exit 1
    fi
fi
exit 0
