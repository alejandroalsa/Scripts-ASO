#!/bin/bash
clear
function ayuda() {
    echo "Este script solicita un valor X e Y para imprimir los números desde X hasta Y."
    echo "Ejecute el script y siga las instrucciones para ingresar los valores."
    echo "El valor de X debe ser menor o igual que Y."
    echo "Ingrese '99' para salir del script."
    exit 1
}

#---->Explicación 30
while true; do
  read -p "Introduce el valor de X (99 para salir): " X
  if [ "$X" = 99 ]; then
    exit 0
  fi
  read -p "Introduce el valor de Y: " Y
  #---->Explicación 31
  for ((i=X; i<=Y; i++)); do
    echo -n "$i/$Y "
  done
  echo ""
done
