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
# La línea if [ $# -ne 3 ]; then comprueba el número de argumentos recibidos. Si es distinto de 3, muestra un mensaje de error y una breve descripción de cómo usar el script.
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
# Las líneas siguientes comprueban que los archivos $archivo1 y $archivo2 existen. Si alguno de los archivos no existe, muestra un mensaje de error y sale del script.
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
# La línea diff -u "$archivo1" "$archivo2" > "$archivo_salida" compara los dos archivos y guarda las diferencias en formato unificado en el archivo especificado en $archivo_salida. El operador > redirige la salida del comando diff al archivo de salida.
diff -u "$archivo1" "$archivo2" > "$archivo_salida"

cat "$archivo_salida"
