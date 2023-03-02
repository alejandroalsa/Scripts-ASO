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
# La línea if [ $# -ne 1 ]; then comprueba el número de argumentos recibidos. Si es distinto de 1, muestra un mensaje de error y una breve descripción de cómo usar el script.
if [ $# -ne 1 ]; then
  echo "Número de argumentos incorrecto"
  echo "Uso: $0 <archivo>"
  ayuda
  exit 1
fi

archivo=$1

#---->Explicación 33
# La línea if [ ! -f "$archivo" ]; then comprueba si el archivo especificado en $archivo existe. Si no existe, muestra un mensaje de error y sale del script.
if [ ! -f "$archivo" ]; then
  echo "El archivo $archivo no existe"
  ayuda
  exit 1
fi

#---->Explicación 34
# Las líneas siguientes muestran el número de líneas, palabras y caracteres en el archivo, respectivamente. El comando wc se utiliza para contar las líneas, palabras y caracteres en el archivo. El operador < se utiliza para redirigir la entrada del comando wc desde el archivo especificado por $archivo.
nl "$archivo"
echo ""
echo "Número de líneas: $(wc -l < "$archivo")"
echo "Número de palabras: $(wc -w < "$archivo")"
echo "Número de caracteres: $(wc -c < "$archivo")"

exit 0
