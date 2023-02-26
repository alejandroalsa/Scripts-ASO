#!/bin/bash
clear

function ayuda() {
  echo "Este script lista los archivos en el directorio actual y los escribe en un archivo de salida en formato 'nombre_archivo:permisos_usuario:permisos_grupo:permisos_otros'"
  echo ""
  echo "Uso: $0 <archivo_salida>"
  echo ""
  echo "Argumentos:"
  echo "  archivo_salida: el nombre del archivo en el que se escribirá la lista de archivos (obligatorio)"
  exit 1
}

#---->Explicación 38
if [ $# -ne 1 ]; then
  echo "Número de argumentos incorrecto"
  echo "Uso: $0 <archivo_salida>"
  ayuda
  exit 1
fi

archivo_salida=$1

#---->Explicación 39
ls -1 | awk -v FS="" -v OFS=":" '{$1=$1; print}' > "$archivo_salida"

exit 0