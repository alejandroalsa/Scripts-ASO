#!/bin/bash
clear

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
