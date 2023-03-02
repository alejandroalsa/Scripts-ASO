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
# El programa usa un bucle while que se repite hasta que se ingrese 99 como valor de x. Dentro del bucle, se le pide al usuario que infrese el valor de x y y usando el comando read. Luego, se usa un bucle for para contar desde x hasta y e imprimir el valor actual dividido por y. La opción -n de echo se utiliza para imprimir si una nueva linea, lo que permite que los valores se impriman en la misma línea. Finalmente, se usa el comando echo para imprimir una nueva línea después de cada secuencia de valores. Si se ingresa 99 como valor de x, el programa sele con el comando exit.
while true; do
  read -p "Introduce el valor de X (99 para salir): " X
  if [ "$X" = 99 ]; then
    exit 0
  fi
  read -p "Introduce el valor de Y: " Y
  #---->Explicación 31
# El fragmento de código for ((i=X; i<=Y; i++)); do es un bucle for en Bash que permite iterar una variable i desde el valor de X hasta el valor de Y, incrementando su valor en 1 en cada iteración.
  for ((i=X; i<=Y; i++)); do
    echo -n "$i/$Y "
  done
  echo ""
done
