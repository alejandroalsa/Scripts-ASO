#!/bin/bash
clear

# Función de ayuda
ayuda() {
  echo "Este script calcula el resultado de la siguiente expresión:"
  echo "3x^2 + 5x + 8"
  echo ""
  echo "Uso: $0"
  exit 1
}

#---->Explicación 56
# Esta sección define una función llamada is_number que toma un argumento y devuelve 0 si el argumento es un número y 1 si no lo es. La función utiliza la expresión regular para verificar si el argumento es un número. La expresión regular coincide con los números con o sin signo, números decimales y números en notación científica.
is_number() {
  if echo "$1" | grep -Eq '^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$'; then
    return 0
  else
    return 1
  fi
}

read -p "Introduce un valor numérico: " x

#---->Explicación 57
# Esta sección utiliza la función is_number para verificar si el valor introducido por el usuario es un número. Si es así, se realiza un cálculo utilizando la fórmula 3*x**2 + 5*x + 8 y se muestra el resultado. De lo contrario, se muestra un mensaje de error pidiendo al usuario que introduzca un valor numérico válido.
if is_number "$x"; then
  resultado=$((3*x**2 + 5*x + 8))
  echo "El resultado es: $resultado"
else
  echo "El valor introducido no es un número válido. Introduce un valor numérico."
  ayuda
  exit 1
fi
exit 0
# Función de ayuda
ayuda() {
  echo "Este script calcula el resultado de la siguiente expresión:"
  echo "3x^2 + 5x + 8"
  echo ""
  echo "Uso: $0"
}