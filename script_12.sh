#!/bin/bash
clear


function ayuda() {
  echo "Este script muestra los archivos de un directorio y permite seleccionar uno para ver información sobre él."
  echo ""
  echo "Uso: $0 <directorio>"
  echo "  <directorio> : directorio que se quiere analizar"
  echo ""
  echo "Ejemplo: $0 /home/user/documentos"
  exit 1
}

#---->Explicación 40
# La línea if [ $# -ne 1 ]; then comprueba el número de argumentos recibidos. Si es distinto de 1, muestra un mensaje de error y una breve descripción de cómo usar el script.
if [ $# -ne 1 ]; then
  echo "Número de argumentos incorrecto"
  echo "Uso: $0 <directorio>"
  ayuda
  exit 1
fi

directorio=$1

#---->Explicación 41
# El comando if [ ! -d "$directorio" ]; then comprueba si el directorio especificado existe. Si no existe, muestra un mensaje de error y sale del script con un código de salida distinto de cero.
if [ ! -d "$directorio" ]; then
  echo "El directorio $directorio no existe"
  ayuda
  exit 1
fi

archivos=("$directorio"/*)

#---->Explicación 42
# La función obtener_archivo() toma un argumento que es la posición del archivo en el array. La función comprueba si hay un archivo en la posición dada y, si lo hay, muestra su nombre y el número de caracteres que contiene utilizando el comando wc.
function obtener_archivo() {
  local posicion=$1
  local archivo=${archivos[posicion]}

  if [ -n "$archivo" ]; then
    echo "Archivo en la posición $posicion: $archivo"
    echo "Número de caracteres: $(wc -c < "$archivo")"
  else
    echo "No hay archivo en la posición $posicion"
  fi
}

#---->Explicación 43
# El bucle while true; do pide al usuario que seleccione un archivo hasta que introduzca el valor 0. Dentro del bucle, la línea read -p "Introduce un número entre 1 y ${#archivos[@]} (0 para salir): " seleccion muestra un mensaje al usuario y espera una entrada de teclado.
while true; do
  read -p "Introduce un número entre 1 y ${#archivos[@]} (0 para salir): " seleccion

  if [ "$seleccion" -eq 0 ]; then
    break
  elif [ "$seleccion" -ge 1 ] && [ "$seleccion" -le "${#archivos[@]}" ]; then
    obtener_archivo "$((seleccion - 1))"
  else
    echo "Número no válido"
    ayuda
    exit 1
  fi
done

exit 0