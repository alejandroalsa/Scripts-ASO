#!/bin/bash
clear


function ayuda {
    echo "Este script procesa un archivo de entrada y crea un archivo de salida"
    echo "con los nombres, apellidos, DNI y un código generado a partir de estos datos"
    echo ""
    echo "Uso:"
    echo "  $0 archivo_entrada archivo_salida"
    echo ""
    echo "Argumentos:"
    echo "  archivo_entrada: archivo con los datos de entrada (nombre, apellidos y DNI separados por ;)"
    echo "  archivo_salida: archivo donde se guardarán los datos procesados (nombre, apellidos, DNI y código generado)"
    echo ""
    exit 1
}

#---->Explicación 05
# Una simple comprobación de argumentos
if [ $# != 2 ]; then
    
    echo "Número de parametros incorrectos"
    ayuda
    exit 1

else
    echo "Número de Argumentos correctos"
    
    #---->Explicación 06
# Comprobación de archivos donde le pasamos los dos argumentos y comprueba si existen.
    if [ -e $1 ] && [ -e $2 ]; then
        echo "Existe"
        echo "Creado el archivo"
        echo "Siguiente"
    else
        echo "El archivo de entrada o salida no existe, por favor cre el archivo de entrda, el archivo de salida ya ha sido creado"
        touch $2
        ayuda
        exit 1
    fi

fi

#---->Explicación 07
# Esta parte del código está tomando una línea de un archivo (llamado linea) y utilizando comandos de Linux como cut y tr para manipular y extraer información de esa línea. Luego, está combinando esa información extraída para crear una nueva cadena de texto (llamada en_row). También está creando una variable people que combina el nombre y el apellido de la persona de la línea original. Además, está creando una variable ex_intro que combina people, un punto y coma, y en_row. Finalmente, está buscando en otro archivo (llamado $2) si hay una coincidencia con la variable ex_intro usando el comando grep.
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
# Al extraer los datos de las líneas de la variable comparison los evaluamos en un if donde se le aplica la lógica de que si son iguales dará el error de: El usuario $en_row ya existe, si no saltara a la siguiente línea.
    if [[ $comparison == $ex_intro ]]; then
        echo "El usuario $en_row ya existe"
        ayuda
        exit 1
    else
        #---->Explicación 09
# Ejecutamos otra instrucción de comparación indicándole que si hay una línea con el texto NOMBRE;APELLIDOS;DNI lo deje vacío y si no que introduzca los datos en la línea siguiente del archivo introducido como segundo argumento.
        if [ $en_row = "NOMBRE;APELLIDOS;DNI" ]; then 
            echo ""
        else
            echo "$ex_intro" >> $2
            echo "El usuario ha sido creado"
            exit 0
        fi
    fi
done < $1
