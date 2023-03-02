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
# La línea if [ $# != 3 ]; then verifica si el número de argumentos ($#) es diferente de 3. Si es así, se ejecutan las siguientes tres líneas.
if [ $# != 3 ]; then
    echo -e "\033[1;91mNúmero de argumentos incorrecto\033[0m"
    echo -e "Por favor introduzca \033[1;97mtres argumentos\033[0m"
    ayuda
    exit 1
else
    echo -e "Número de argumentos \033[1;92mcorrecto\033[0m"
fi

#---->Explicación 11
# Evalúa una expresión matemática y redirige la salida a /dev/null, expr $1 + 1 evalúa la expresión matemática sumando 1 al primer argumento ($1) pasado al script. > /dev/null 2>&1 redirige la salida estándar y la salida de error a /dev/null, que es un archivo especial en Unix/Linux que descarta todos los datos que se escriben en él. Esto significa que cualquier salida generada por la expresión matemática no será mostrada en la consola.
expr $1 + 1 > /dev/null 2>&1

#---->Explicación 12
# La línea if (( $? < 2 )); then verifica el valor de la variable especial $?. Esta variable contiene el código de salida del último comando ejecutado. Si el valor es menor que 2, significa que el comando anterior se ejecutó correctamente y el primer argumento es un número.
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
# Verifica si el tercer argumento ($3) pasado al script es un símbolo de operación (+, -, *, /) o no.

# El comando if [ $3 = "+" ] || [ $3 = "-" ] || [ $3 = "*" ] || [ $3 = "/" ]; then comprueba si el tercer argumento es igual a +, -, * o /, utilizando cuatro condicionales OR (||) para comprobar cada posible valor.
if [ $3 = "+" ] || [ $3 = "-" ] || [ $3 = "*" ] || [ $3 = "/" ]; then
  echo -e "El tercer argumento \033[1;97m$3\033[0m es \033[1;92mcorrecto\033[0m"
else
  echo -e "\033[1;91mEl tercer argumento\033[0m \033[1;97m$3 \033[1;91mno es un símbolo de operación (+, -, *, /)\033[0m"
  ayuda
  exit 1
fi

operacion=$(($1 $3 $2))

#---->Explicación 14
# Es un código de escape ANSI que cambia el color de la salida. Puedes encontrar una lista de todas las combinaciones aquí:
echo -e "Se ha realizado la operación: \033[1;97m$1 $3 $2 = $operacion\033[0m"

exit 0
