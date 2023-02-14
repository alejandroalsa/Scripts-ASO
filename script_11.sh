#!/bin/bash
clear

#---->Explicación 38
if [ $# -ne 1 ]; then
  echo "Número de argumentos incorrecto"
  echo "Uso: $0 <archivo_salida>"
  exit 1
fi

archivo_salida=$1

#---->Explicación 39
ls -1 | awk -v FS="" -v OFS=":" '{$1=$1; print}' > "$archivo_salida"
