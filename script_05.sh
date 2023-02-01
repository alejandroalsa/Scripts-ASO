#!/bin/bash
clear

OPC="0"

#---->Explicación 19
until [ $OPC = "5" ]; do 
    clear
    echo "Menu"
    echo "1) Dar permiso de ejecución a todos los archivos de un directorio."
    echo "2) Quitar permiso de ejecución a todos los archivos de un directorio."
    echo "3) Hacer copia de seguridad del directorio de trabajo de un usuario."
    echo "4) Obtener en un archivo los 20 inicios de sesión más recientes."
    echo "5) Salir."
    echo
    read -n 2 -p "Seleccione algunas de las opciones: " OPC
    echo

 case $OPC in 


    1) echo "Dar permiso de ejecución a todos los archivos de un directorio."
    read -p "Introduzca el directorio: " DIR_OPC_01
    chmod +x $DIR_OPC_01/*.*
    read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA;;


    2) echo "Quitar permiso de ejecución a todos los archivos de un directorio."
    read -p "Introduzca el directorio: " DIR_OPC_02
    chmod -x $DIR_OPC_02/*.*
    read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA;;

#---->Explicación 20
    3) echo "Hacer copia de seguridad del directorio de trabajo de un usuario."
    read -p "Nombre de usuario para realizar su copia de seguridad: " NAME_USER

    if id $NAME_USER >/dev/null 2>&1; then 
        zip -r /tmp/copia_seguridad_$NAME_USER-$(date +%Y_%m_%d_%H:%M:%S).zip /home/$NAME_USER/
        echo "Se a creado una copia de seguridad del directorio /home/$NAME_USER/ y se a almacenado en /tmp/copia_seguridad_$NAME_USER-$(date +%Y_%m_%d_%H:%M:%S).zip"
    else 
        echo "Lo siento pero ese usuario no existe"
        read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA
    fi
    read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA;;

    #---->Explicación 21
        4) echo "Obtener en un archivo los 20 inicios de sesión más recientes."
        rm -rf ultimos20.log
        last -20 >>  ultimos20.log
        read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA;;

    5) echo "Adios.";;

 esac
done
