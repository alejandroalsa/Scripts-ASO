#!/bin/bash
clear

function ayuda {
  echo "Uso: ./calculadora.sh NUMERO_1 NUMERO_2 OPERACION"
  echo ""
  echo "Ejemplos:"
  echo "./calculadora.sh 5 10 +   (suma 5 y 10)"
  echo "./calculadora.sh 20 6 -   (resta 6 de 20)"
  echo "./calculadora.sh 3 4 *    (multiplica 3 y 4)"
  echo "./calculadora.sh 15 3 /   (divide 15 entre 3)"
  echo ""
  echo "Por favor asegúrese de que los dos primeros argumentos son números enteros y el tercer argumento es uno de los siguientes símbolos de operación: +, -, *, /."
  exit 1
}


#---->Explicación 10
if [ $# != 3 ]; then
    echo -e "\033[1;91mNúmero de argumentos incorrecto\033[0m"
    echo -e "Por favor introduzca \033[1;97mtres argumentos\033[0m"
    ayuda
    exit 1
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
  ayuda
  exit 1
fi

expr $2 + 1 > /dev/null 2>&1
if (( $? < 2 )); then
  echo -e "El segundo argumento \033[1;97m$2\033[0m es \033[1;92mcorrecto\033[0m"
else
  echo -e "\033[1;91mEl segundo argumento\033[0m \033[1;97m$2 \033[1;91mno es un número\033[0m"
  ayuda
  exit 1
fi

#---->Explicación 13
if [ $3 = "+" ] || [ $3 = "-" ] || [ $3 = "*" ] || [ $3 = "/" ]; then
  echo -e "El tercer argumento \033[1;97m$3\033[0m es \033[1;92mcorrecto\033[0m"
else
  echo -e "\033[1;91mEl tercer argumento\033[0m \033[1;97m$3 \033[1;91mno es un símbolo de operación (+, -, *, /)\033[0m"
  ayuda
  exit 1
fi

operacion=$(($1 $3 $2))

#---->Explicación 14
echo -e "Se ha realizado la operación: \033[1;97m$1 $3 $2 = $operacion\033[0m"

exit 0
