#!/bin/bash
clear

#---->Explicación 10
if [ $# != 3 ]; then
    echo -e "\033[1;91mNúmero de argumentos incorrecto\033[0m"
    echo -e "Por favor introduzca \033[1;97mtres argumentos\033[0m"
    exit
else
    echo -e "Número de argumentos \033[1;92mcorrecto\033[0m"
fi

#---->Explicación 11
expr $1 + 1 > /dev/null 2>&1

#---->Explicación 12
if (( $? < 2 )); then
  echo -e "El primer argumento \033[1;97m$1\033[0m es \033[1;92mcorrecto\033[0m"
else
  echo -e "\033[1;91mEl primer argumento\033[0m \033[1;97m$1 \033[1;91mno es un número\033[0m"
  exit
fi

expr $2 + 1 > /dev/null 2>&1
if (( $? < 2 )); then
  echo -e "El segundo argumento \033[1;97m$2\033[0m es \033[1;92mcorrecto\033[0m"
else
  echo -e "\033[1;91mEl segundo argumento\033[0m \033[1;97m$2 \033[1;91mno es un número\033[0m"
  exit
fi

#---->Explicación 13
if [ $3 = "+" ] || [ $3 = "-" ] || [ $3 = "*" ] || [ $3 = "/" ]; then
  echo -e "El tercer argumento \033[1;97m$3\033[0m es \033[1;92mcorrecto\033[0m"
else
  echo -e "\033[1;91mEl tercer argumento\033[0m \033[1;97m$3 \033[1;91mno es un símbolo de operación (+, -, *, /)\033[0m"
  exit
fi

operacion=$(($1 $3 $2))

#---->Explicación 14
echo -e "Se ha realizado la operación: \033[1;97m$1 $3 $2 = $operacion\033[0m"

exit 0
