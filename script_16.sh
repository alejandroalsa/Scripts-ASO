#!/bin/bash
clear

function ayuda {
  echo "Este script procesa un archivo de texto de cuatro maneras diferentes:"
  echo "1. Convierte todo el contenido del archivo a minúsculas."
  echo "2. Convierte todo el contenido del archivo a mayúsculas."
  echo "3. Elimina todas las ocurrencias de la letra 'a' del archivo."
  echo "4. Convierte todas las vocales del archivo a mayúsculas."
  echo ""
  echo "Uso: $0 <archivo>"
  echo ""
  echo "Parámetros:"
  echo "  <archivo>: El archivo de texto a procesar."
  exit 1
}

#---->Explicación 51
# if [ $# -eq 0 ]; then: Esta línea comprueba si el número de argumentos proporcionados al script es cero. Si no se proporciona ningún argumento, muestra un mensaje de error y sale del script con un código de salida de 1.
if [ $# -eq 0 ]; then
  echo "Error: debe proporcionar un archivo como argumento"
  ayuda
  exit 1
fi

input_file="$1"
output_file_lower="R_minusculas.txt"
output_file_upper="R_mayusculas.txt"
output_file_no_a="R_sinA.txt"
output_file_vowels="R_VOCALES.txt"

#---->Explicación 52
# tr '[:upper:]' '[:lower:]' < "$input_file" > "$output_file_lower": Esta línea utiliza el comando tr para convertir el contenido del archivo de entrada en minúsculas y escribir el resultado en un archivo de salida. La opción -t indica la tabla de conversión a utilizar, y los argumentos '[:upper:]' y '[:lower:]' indican que se deben convertir las letras mayúsculas a minúsculas. El símbolo < indica que el archivo de entrada debe ser leído como entrada estándar, y el símbolo > indica que la salida debe escribirse en un archivo.
tr '[:upper:]' '[:lower:]' < "$input_file" > "$output_file_lower"
echo "El contenido en minúsculas se ha guardado en $output_file_lower"

#---->Explicación 53
# tr '[:lower:]' '[:upper:]' < "$input_file" > "$output_file_upper": Esta línea utiliza el comando tr para convertir el contenido del archivo de entrada en mayúsculas y escribir el resultado en un archivo de salida. La opción -t indica la tabla de conversión a utilizar, y los argumentos '[:lower:]' y '[:upper:]' indican que se deben convertir las letras minúsculas a mayúsculas. El símbolo < indica que el archivo de entrada debe ser leído como entrada estándar, y el símbolo > indica que la salida debe escribirse en un archivo.
tr '[:lower:]' '[:upper:]' < "$input_file" > "$output_file_upper"
echo "El contenido en mayúsculas se ha guardado en $output_file_upper"

#---->Explicación 54
# sed 's/a//g' < "$input_file" > "$output_file_no_a": Esta línea utiliza el comando sed para eliminar todas las ocurrencias de la letra a en el archivo de entrada $input_file y guardar el resultado en el archivo de salida $output_file_no_a.
sed 's/a//g' < "$input_file" > "$output_file_no_a"
echo "El contenido sin 'a' se ha guardado en $output_file_no_a"

#---->Explicación 55
# sed 's/[aeiou]/\U&/g' < "$input_file" > "$output_file_vowels": Esta línea utiliza el comando sed para buscar en el archivo de entrada $input_file cualquier ocurrencia de las letras a, e, i, o o u y reemplazarlas por la misma letra en mayúsculas. Luego, el resultado se guarda en el archivo de salida $output_file_vowels.
sed 's/[aeiou]/\U&/g' < "$input_file" > "$output_file_vowels"
echo "El contenido con vocales en mayúsculas se ha guardado en $output_file_vowels"

exit 0
