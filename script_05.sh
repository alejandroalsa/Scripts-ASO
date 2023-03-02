#!/bin/bash
clear
function ayuda {
    echo "Este script es un ejemplo de uso de Bash para realizar diferentes tareas."
    echo "Para utilizarlo, seleccione una opción del menú principal."
    echo
    echo "Opciones:"
    echo "1) Dar permiso de ejecución a todos los archivos de un directorio."
    echo "2) Quitar permiso de ejecución a todos los archivos de un directorio."
    echo "3) Hacer copia de seguridad del directorio de trabajo de un usuario."
    echo "4) Obtener en un archivo los 20 inicios de sesión más recientes."
    echo "5) Salir."
    echo
    echo "Ejemplo de uso:"
    echo "./nombre_del_script.sh"
    echo
    echo "Autor: Tu nombre aquí"
  exit 1
}



OPC="0"

#---->Explicación 19
# Una estructura de control de menú en un script de bash. La sentencia until se utiliza para repetir un bloque de código hasta que la condición se cumpla. En este caso, la condición es [ $OPC = "5" ], lo que significa que el script se repetirá hasta que la variable OPC sea igual a 5.
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
# Primero, se lee el nombre de usuario del que se desea realizar la copia de seguridad mediante la sentencia read.
# Luego, se usa el comando id para verificar si el usuario especificado existe en el sistema. La opción >/dev/null 2>&1 redirige la salida estándar y la salida de error a /dev/null, lo que significa que no se mostrará ningún mensaje en la pantalla. Si el usuario existe, el script usa el comando zip para comprimir el directorio /home/$NAME_USER/ y crear un archivo ZIP en la ruta /tmp/copia_seguridad_$NAME_USER-$(date +%Y_%m_%d_%H:%M:%S).zip. El $(date +%Y_%m_%d_%H:%M:%S) se utiliza para generar una fecha y hora actual en formato año-mes-día-hora:minuto:segundo.
# Si el usuario no existe, se muestra un mensaje de error y se pide al usuario que pulse una tecla para volver al menú. Finalmente, el script pide al usuario que pulse una tecla para volver al menú, independientemente de si la copia de seguridad se realizó correctamente o no.
    3) echo "Hacer copia de seguridad del directorio de trabajo de un usuario."
    read -p "Nombre de usuario para realizar su copia de seguridad: " NAME_USER

    if id $NAME_USER >/dev/null 2>&1; then 
        zip -r /tmp/copia_seguridad_$NAME_USER-$(date +%Y_%m_%d_%H:%M:%S).zip /home/$NAME_USER/
        echo "Se a creado una copia de seguridad del directorio /home/$NAME_USER/ y se a almacenado en /tmp/copia_seguridad_$NAME_USER-$(date +%Y_%m_%d_%H:%M:%S).zip"
    else 
        echo "Lo siento pero ese usuario no existe"
        ayuda
        read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA
    fi
    read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA;;

    #---->Explicación 21
# Obtener los 20 inicios de sesión más recientes y guardarlos en un archivo. Primero, se borra cualquier archivo previo llamado ultimos20.log mediante el comando rm -rf ultimos20.log.
# Luego, se usa el comando last con la opción -20 para mostrar los 20 últimos inicios de sesión y la redirección >> para agregar la salida a un archivo llamado ultimos20.log.
        4) echo "Obtener en un archivo los 20 inicios de sesión más recientes."
        rm -rf ultimos20.log
        last -20 >>  ultimos20.log
        read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA;;

    5) echo "Adios.";;

 esac
done
