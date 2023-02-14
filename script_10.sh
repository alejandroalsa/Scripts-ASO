#!/bin/bash
clear

#---->Explicación 35
if [ $# -ne 3 ]; then
  echo "Número de argumentos incorrecto"
  echo "Uso: $0 <archivo1> <archivo2> <archivo_salida>"
  exit 1
fi

archivo1=$1
archivo2=$2
archivo_salida=$3

#---->Explicación 36
if [ ! -f "$archivo1" ]; then
  echo "El archivo $archivo1 no existe"
  exit 1
fi

if [ ! -f "$archivo2" ]; then
  echo "El archivo $archivo2 no existe"
  exit 1
fi

#---->Explicación 37
diff -u "$archivo1" "$archivo2" > "$archivo_salida"

cat "$archivo_salida"
