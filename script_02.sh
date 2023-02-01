#!/bin/bash
clear

#---->Explicación 05
if [ $# != 2 ]; then
    
    echo "Número de parametros incorrectos"
    exit

else
    echo "Número de Argumentos correctos"
    
    #---->Explicación 06
    if [ -e $1 ] && [ -e $2 ]; then
        echo "Existe"
        echo "Creado el archivo"
        echo "Siguiente"
    else
        echo "El archivo de entrada o salida no existe, por favor cre el archivo de entrda, el archivo de salida ya ha sido creado"
        touch $2
        exit
    fi

fi

#---->Explicación 07
while IFS= read -r linea; do

    en_name=$(echo "$linea" | cut -c 1 | tr [[:upper:]] [[:lower:]])
    en_surename=$(echo "$linea" | cut -d ';' -f2 | cut -c 1-3 | tr [[:upper:]] [[:lower:]])
    en_nif=$(echo "$linea" | cut -d ';' -f3 | rev | cut -c 1,2 | rev)
    en_row=$(echo "$en_name$en_surename$en_nif")
    ex_name=$(echo "$linea" | cut -d ';' -f1)
    ex_surname=$(echo "$linea" | cut -d ';' -f2)
    people=$(echo $ex_name $ex_surname)
    ex_semicolon=$(echo ";")
    ex_intro=$(echo "$people$ex_semicolon$en_row")
    comparison=$(cat $2 | grep "$ex_intro")
    #---->Explicación 08
    if [[ $comparison == $ex_intro ]]; then
        echo "El usuario $en_row ya existe"
    else
        #---->Explicación 09
        if [ $en_row = "NOMBRE;APELLIDOS;DNI" ]; then 
            echo ""
        else
            echo "$ex_intro" >> $2
            echo "El usuario ha sido creado"
        fi
    fi
done < $1
