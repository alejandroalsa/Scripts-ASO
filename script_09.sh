#!/bin/bash
clear

#---->Explicación 32
if [ $# -ne 1 ]; then
  echo "Número de argumentos incorrecto"
  echo "Uso: $0 <archivo>"
  exit 1
fi

archivo=$1

#---->Explicación 33
if [ ! -f "$archivo" ]; then
  echo "El archivo $archivo no existe"
  exit 1
fi

#---->Explicación 34
nl "$archivo"
echo ""
echo "Número de líneas: $(wc -l < "$archivo")"
echo "Número de palabras: $(wc -w < "$archivo")"
echo "Número de caracteres: $(wc -c < "$archivo")"
