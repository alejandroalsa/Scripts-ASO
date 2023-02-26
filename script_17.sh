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
is_number() {
  if echo "$1" | grep -Eq '^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$'; then
    return 0
  else
    return 1
  fi
}

read -p "Introduce un valor numérico: " x

#---->Explicación 57
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