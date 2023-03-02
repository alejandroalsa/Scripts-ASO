#!/bin/bash
clear
function ayuda {
    echo "Este script lee caracteres de la entrada estándar y determina si son letras o números."
    echo "Uso: $0"
    echo "Presione Ctrl+C para salir."
    exit 1
}

#---->Explicación 44
# Este es el inicio de un bucle while. La condición de este bucle es simplemente true, lo que significa que se ejecutará indefinidamente hasta que se encuentre una instrucción de break.
while true; do
    read -n 1 char

    #---->Explicación 45
# Esta parte verifica si el carácter leído es la tecla Intro. Si es así, la instrucción break se ejecuta y el bucle se detiene.
    if [[ $char == $'\n' ]]; then
        break
    fi
    
    #---->Explicación 46
# Esta es la parte principal del script, donde se determina si el carácter leído es un número o una letra. La construcción [[ ... ]] es una forma de evaluación de expresiones condicionales en bash, similar a los paréntesis de los if en otros lenguajes de programación. La expresión $char =~ [0-9] evalúa si el carácter en la variable $char es un número. La expresión $char =~ [a-zA-Z] evalúa si el carácter es una letra (mayúscula o minúscula). Si ninguna de las dos expresiones es verdadera, se asume que el carácter es 0 y se informa al usuario de que no es ni un número ni una letra.
    if [[ "$char" =~ [0-9] ]]; then
        echo "-$char es un número"
    elif [[ "$char" =~ [a-zA-Z] ]]; then
        echo "-$char es una letra"
    else
        echo "0 no es una letra ni un número"
    fi
done
exit 0