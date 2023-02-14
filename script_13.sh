#!/bin/bash
clear

#---->Explicación 44
while true; do
    read -n 1 char

    #---->Explicación 45
    if [[ $char == $'\n' ]]; then
        break
    fi
    
    #---->Explicación 46
    if [[ "$char" =~ [0-9] ]]; then
        echo "-$char es un número"
    elif [[ "$char" =~ [a-zA-Z] ]]; then
        echo "-$char es una letra"
    else
        echo "0 no es una letra ni un número"
    fi
done
