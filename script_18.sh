#!/bin/bash

clear

# Definir función de ayuda
function ayuda {
  echo "Este script valida si una dirección de correo electrónico tiene una estructura válida."
  echo "Por favor, introduce una dirección de correo electrónico válida cuando se te solicite."
}

# Procesar opciones del script
while getopts "h" opt; do
  case ${opt} in
    h ) # Si se introduce la opción -h, mostrar ayuda y salir del script
        ayuda
        exit 0;;
    \? ) # Si se introduce una opción inválida, mostrar mensaje de error y ayuda, y salir del script con código de salida 1
         echo "Opción inválida: -$OPTARG" 1>&2
         ayuda
         exit 1;;
  esac
done

# Pedir dirección de correo electrónico y validarla
while true; do # Ciclo while infinito
  echo "Por favor, introduce tu dirección de correo electrónico:"
  read email # Leer dirección de correo electrónico introducida por el usuario
  clear

  if [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
    # Si la dirección de correo electrónico es válida según la expresión regular, imprimir mensaje y salir del ciclo while
    echo "$email es una dirección de correo electrónico válida."
    break
  else
    # Si la dirección de correo electrónico no es válida según la expresión regular, imprimir mensaje de error y volver a pedir dirección de correo electrónico
    echo "$email no es una dirección de correo electrónico válida. Por favor, inténtalo de nuevo."
  fi
done
exit 0
