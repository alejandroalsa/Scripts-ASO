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
# La línea if [ $# -ne 1 ]; then comprueba el número de argumentos recibidos. Si es distinto de 1, muestra un mensaje de error y una breve descripción de cómo usar el script.
if [ $# -ne 1 ]; then
  echo "Número de argumentos incorrecto"
  echo "Uso: $0 <archivo_salida>"
  ayuda
  exit 1
fi

archivo_salida=$1

#---->Explicación 39
# El comando awk procesa la salida de ls y convierte los espacios en dos puntos como separador de campo. La opción -v FS="" especifica que el separador de campo es una cadena vacía, lo que hace que awk procese cada carácter como un campo separado. La opción -v OFS=":" especifica que el separador de campo de salida es un dos puntos. La expresión {$1=$1; print} es una forma de forzar que awk procese cada línea y produzca una salida con los nuevos separadores de campo.
ls -1 | awk -v FS="" -v OFS=":" '{$1=$1; print}' > "$archivo_salida"

exit 0