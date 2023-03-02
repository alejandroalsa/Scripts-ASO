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
# Verifica el número de argumentos pasados al script. Si el número de argumentos es diferente a 2, se muestra un mensaje de error en rojo y se termina el script con el comando exit.
# La expresión $# != 2 significa que el número de argumentos es diferente a 2. El operador != significa diferente a y el número 2 representa la cantidad de argumentos que se esperan. El simbolo $# representa el número total de argumentos.
if [ $# != 2 ]; then
    echo -e "\033[1;91mNúmero de argumentos incorrecto\033[0m"
    ayuda 
    exit 1
fi

#---->Explicación 23
# Esta línea de código verifica si el archivo especificado como segundo argumento existe en el directorio especificado como primer argumento. Si no existe, se muestra un mensaje de error en rojo indicando que el archivo no existe en el directorio y se termina el script con el comando exit.
# La expresión [ ! -f "$1/$2" ] significa que se está verificando si el archivo $2 no existe en el directorio $1. La opción -f significa es un archivo regular, y el signo de exclamación ! significa no. De esta forma, se está verificando que el archivo sea un archivo regular y no un directorio o un enlace simbólico, por ejemplo.
if [ ! -f "$1/$2" ]; then
    echo -e "\033[1;91mEl archivo\033[0m \033[1;97m$2 \033[1;91mno existe en el direcorio\033[0m \033[1;97m$1 \033[0m"
    ayuda
    exit 1
fi

read -p "¿Quieres acceder al contenido del archivo (s/n)? " RESPUESTA

#---->Explicación 24
# verifica si la respuesta del usuario a la pregunta anterior fue s (afirmativo). Si es así, se verifica si el archivo $2 es un directorio con el comando [ ! -d "$1/$2" ]. Si no es un directorio (es un archivo regular), se muestra su contenido en la consola con el comando cat $1/$2.
# Si el archivo es un directorio, se muestra un mensaje de error en rojo indicando que $2 es un directorio y no un archivo, y se termina el script con el comando exit. La expresión [ ! -d "$1/$2" ] significa no es un directorio.
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
