#!/bin/bash
clear


function ayuda {
  echo "Este script muestra el contenido de un archivo de texto y cuenta el número de líneas, palabras y caracteres."
  echo "Uso: $0 <archivo>"
  echo "Parámetros:"
  echo "  <archivo>   Nombre del archivo a analizar"
  exit 1
}

#---->Explicación 32
if [ $# -ne 1 ]; then
  echo "Número de argumentos incorrecto"
  echo "Uso: $0 <archivo>"
  ayuda
  exit 1
fi

archivo=$1

#---->Explicación 33
if [ ! -f "$archivo" ]; then
  echo "El archivo $archivo no existe"
  ayuda
  exit 1
fi

#---->Explicación 34
nl "$archivo"
echo ""
echo "Número de líneas: $(wc -l < "$archivo")"
echo "Número de palabras: $(wc -w < "$archivo")"
echo "Número de caracteres: $(wc -c < "$archivo")"

exit 0
