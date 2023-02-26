#!/bin/bash
clear

OPC="0"

function ayuda(){
    clear
    echo "Este script realiza diversas operaciones del sistema, incluyendo:"
    echo "- Crear, habilitar, deshabilitar o eliminar un usuario del sistema."
    echo "- Cambiar permisos a un archivo o directorio."
    echo "- Realizar una copia de seguridad del directorio de trabajo de un usuario."
    echo "- Mostrar los usuarios conectados actualmente al sistema."
    echo "- Mostrar el espacio libre en disco."
    echo "- Trazar una ruta especificada por el usuario."
    echo
    echo "Instrucciones de uso:"
    echo "1. Ejecute el script desde una terminal."
    echo "2. Seleccione una de las opciones del menú y siga las instrucciones."
    echo
    echo "Ejemplo de uso: ./script.sh"
    read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA
}

#---->Explicación 01
until [ $OPC = "10" ]; do
    clear
    echo "Menu"
    echo "a) Ayuda."
    echo "1) Crear usuario."
    echo "2) Habilitar usuario."
    echo "3) Deshabilitar usuario."
    echo "4) Eliminar usuario."
    echo "5) Cambiar permisos a un usuario."
    echo "6) Copia de seguridad del directorio de trabajo de un usuario determinado."
    echo "7) Usuarios conectados actualmente."
    echo "8) Espacio libre en disco."
    echo "9) Trazar ruta."
    echo "10) Salir."
    echo
    read -n 2 -p "Seleccione algunas de las opciones: " OPC
    echo
 #---->Explicación 02
 case $OPC in 
    a) ayuda;;
    1) echo "Crear usuario"
    read -p "Nombre de usuario: " NAME_USER
    read -p "Contraseña: " PASS_USER
    echo "Nombre de usuario:" $NAME_USER "Contraseña:" $PASS_USER
    read -n 1 -p "Los datos con correctos [s/n]: " SELECCION
    #---->Explicación 03
    if [ $SELECCION = "s" ]; then 
        echo
        echo "Creando Usuario....."
        useradd -r $NAME_USER -p contraseña -m -d /home/$NAME_USER
        echo "Usuario Creado"
    fi
    echo
    read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA;;

    2) echo "Habilitar usuario"
    read -p "Nombre de usuario a habilitar: " NAME_USER
    usermod -U $NAME_USER
    echo "Usuario $NAME_USER habilitado"
    read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA;;

    3) echo "Deshabilitar usuario"
    read -p "Nombre de usuario a deshabilitar: " NAME_USER
    usermod -L $NAME_USER
    echo "Usuario $NAME_USER deshabilitado"
    read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA;;

    4) echo "Eliminar usuario"
    read -p "Nombre de usuario a eliminar: " NAME_USER
    userdel -r $NAME_USER
    echo "Usuario $NAME_USER eliminado"
    read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA;;

    #---->Explicación 04
    5) echo "Cambiar permisos a un usuario" 
    if [ $1 > 0 ]; then
        read -p "Permisos del PROPIETARIO (1-2-3-4-5-6-7): " OWNER
        read -p "Permisos del GRUPO (1-2-3-4-5-6-7): " GROUP
        read -p "Permisos del OTROS (1-2-3-4-5-6-7): " OTHER
        
        OWNER_OK=$((OWNER >= 1 && OWNER <= 9 ? 1 : 0))
        GROUP_OK=$((GROUP >= 1 && GROUP <= 9 ? 1 : 0))
        OTHER_OK=$((OTHER >= 1 && OTHER <= 9 ? 1 : 0))
        if [ $OWNER_OK == 1 ] && [ $GROUP_OK == 1 ] && [ $OTHER_OK == 1 ]; then
            chmod $OWNER$GROUP$OTHER $1
            ls -la $1
            echo "Permisos cambiados correctamente"

        else
            echo "Permisoso mal declarados"
            read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA
        fi
        read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA

    else
        echo "Es necesaio que introduzca la ruta del directorio o fichero por argumentos"
    fi
    read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA;;
    
    6) echo "Copia de seguridad del directorio de trabajo de un usuario determinado."
    read -p "Nombre de usuario para realizar su copia de seguridad: " NAME_USER
    zip -r /tmp/copia_seguridad_$NAME_USER-$(date +%Y_%m_%d_%H:%M:%S).zip /home/$NAME_USER/
    echo "Se a creado una copia de seguridad del directorio /home/$NAME_USER/ y se a almacenado en /tmp/copia_seguridad_$NAME_USER-$(date +%Y_%m_%d_%H:%M:%S).zip"
    read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA;;

    7) echo "Usuarios conectados actualmente."
    w
    read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA;;

    8) echo "Espacio libre en disco."
    df -h
    read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA;;

    9) echo "Trazar ruta."
    read -p "Direccion IP o dominio para treazar la ruta: " IP_DOMAIN

    # Ejecutar el comando traceroute y verificar si se ejecutó correctamente
    if traceroute $IP_DOMAIN; then
        read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA
    else
        echo "Error: no se pudo ejecutar el comando traceroute."
    fi
    read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA;;

    10) echo "Adios.";;
 esac
done
