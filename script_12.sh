#!/bin/bash
clear

#---->Explicación 40
if [ $# -ne 1 ]; then
  echo "Número de argumentos incorrecto"
  echo "Uso: $0 <directorio>"
  exit 1
fi

directorio=$1

#---->Explicación 41
if [ ! -d "$directorio" ]; then
  echo "El directorio $directorio no existe"
  exit 1
fi

archivos=("$directorio"/*)

#---->Explicación 42
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
while true; do
  read -p "Introduce un número entre 1 y ${#archivos[@]} (0 para salir): " seleccion

  if [ "$seleccion" -eq 0 ]; then
    break
  elif [ "$seleccion" -ge 1 ] && [ "$seleccion" -le "${#archivos[@]}" ]; then
    obtener_archivo "$((seleccion - 1))"
  else
    echo "Número no válido"
  fi
done
