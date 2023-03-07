#!/bin/bash

clear

# Definimos una función de ayuda
function ayuda {
  echo "Uso: $0 <numero1> <numero2>"
  echo "Muestra los números primos que hay entre <numero1> y <numero2>"
  echo "Ejemplo: $0 10 50"
}

# Verificamos que se hayan proporcionado dos argumentos
if [ $# -ne 2 ]; then
  echo "Error: Debe proporcionar dos números como argumentos."
  ayuda
  exit 1
fi

# Asignamos los argumentos a variables
num1=$1
num2=$2

# Verificamos que los argumentos sean números enteros positivos
if ! [[ $num1 =~ ^[0-9]+$ ]] || ! [[ $num2 =~ ^[0-9]+$ ]] || [ $num1 -lt 0 ] || [ $num2 -lt 0 ]; then
  echo "Error: Los argumentos deben ser números enteros positivos."
  ayuda
  exit 1
fi

# Verificamos que el primer número sea menor o igual que el segundo número
if [ $num1 -gt $num2 ]; then
  echo "Error: El primer número debe ser menor o igual que el segundo número."
  ayuda
  exit 1
fi

# Función que verifica si un número es primo
function es_primo {
  if [ $1 -lt 2 ]; then
    return 1
  fi
  for (( i=2; i<$1; i++ )); do
    if [ $(($1%i)) -eq 0 ]; then
      return 1
    fi
  done
  return 0
}

# Recorremos los números entre num1 y num2 y verificamos si son primos
for (( i=$num1; i<=$num2; i++ )); do
  if es_primo $i; then
    echo $i
  fi
done
