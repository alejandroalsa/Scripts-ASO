#!/bin/bash
clear

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
fi
