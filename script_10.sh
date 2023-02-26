#!/bin/bash
clear

function ayuda() {
  echo "Uso: $0 <archivo1> <archivo2> <archivo_salida>"
  echo ""
  echo "Este script compara dos archivos y guarda la diferencia en un tercer archivo."
  echo ""
  echo "Argumentos:"
  echo "  archivo1: archivo a comparar"
  echo "  archivo2: archivo a comparar"
  echo "  archivo_salida: archivo donde se guarda la diferencia"
  echo ""
  exit 1
}

#---->Explicación 35
if [ $# -ne 3 ]; then
  echo "Número de argumentos incorrecto"
  echo "Uso: $0 <archivo1> <archivo2> <archivo_salida>"
  ayuda
  exit 1
fi

archivo1=$1
archivo2=$2
archivo_salida=$3

#---->Explicación 36
if [ ! -f "$archivo1" ]; then
  echo "El archivo $archivo1 no existe"
  ayuda
  exit 1
fi

if [ ! -f "$archivo2" ]; then
  echo "El archivo $archivo2 no existe"
  ayuda
  exit 1
fi

#---->Explicación 37
diff -u "$archivo1" "$archivo2" > "$archivo_salida"

cat "$archivo_salida"
