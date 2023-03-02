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

# El script utiliza un bucle que continúa ejecutándose hasta que el valor de la variable `OPC` sea igual a `10`. El script comienza limpiando la terminal, luego muestra las opciones del menú, numeradas del `1` al `10`. El usuario se le pide que ingrese una selección escribiendo un número entre `1` y `10` y presionando enter. Dependiendo del valor ingresado por el usuario, el script ejecutará un conjunto diferente de comandos. Por ejemplo, si el usuario ingresa `1`, el script creará un nuevo usuario, si el usuario ingresa `2`, el script habilitará un usuario existente, y así sucesivamente. La última opción, `10`, es para salir del script.
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
# Este es un script de shell que continúa con las opciones del menú de la explicación anterior. El script utiliza la sentencia case para manejar diferentes opciones seleccionadas por el usuario.

# Cada opción del menú tiene un bloque de código asociado con ella, que se ejecuta dependiendo del valor de la variable OPC ingresado por el usuario. Por ejemplo, si el usuario ingresa 1, el script ejecutará el bloque de código asociado con la opción Crear usuario, que pide el nombre y la contraseña del nuevo usuario, luego verifica si los datos son correctos y si lo son, se crea el usuario con el comando useradd.
 case $OPC in 
    a) ayuda;;
    1) echo "Crear usuario"
    read -p "Nombre de usuario: " NAME_USER
    read -p "Contraseña: " PASS_USER
    echo "Nombre de usuario:" $NAME_USER "Contraseña:" $PASS_USER
    read -n 1 -p "Los datos con correctos [s/n]: " SELECCION
    #---->Explicación 03
# La primera línea es una condicional if que verifica si la variable SELECCION es igual a s. Esto se refiere a la pregunta anterior donde se le preguntó al usuario si los datos ingresados son correctos. Si la respuesta es s (Sí), entonces se ejecutan las siguientes líneas de código.
    if [ $SELECCION = "s" ]; then 
        echo
        echo "Creando Usuario....."
        useradd -r $NAME_USER -p contraseña -m -d /home/$NAME_USER
        echo "Usuario Creado"
    fi
    echo
    read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA;;
# Opción 2) Habilitar usuario: pide el nombre del usuario a habilitar y habilita ese usuario usando el comando usermod -U.
    2) echo "Habilitar usuario"
    read -p "Nombre de usuario a habilitar: " NAME_USER
    usermod -U $NAME_USER
    echo "Usuario $NAME_USER habilitado"
    read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA;;
# Opción 3) Deshabilitar usuario: es similar, pero deshabilita al usuario usando el comando usermod -L.
    3) echo "Deshabilitar usuario"
    read -p "Nombre de usuario a deshabilitar: " NAME_USER
    usermod -L $NAME_USER
    echo "Usuario $NAME_USER deshabilitado"
    read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA;;
# Opción 4) Eliminar usuario: pide el nombre del usuario a eliminar y elimina ese usuario usando el comando userdel -r.
    4) echo "Eliminar usuario"
    read -p "Nombre de usuario a eliminar: " NAME_USER
    userdel -r $NAME_USER
    echo "Usuario $NAME_USER eliminado"
    read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA;;

    #---->Explicación 04
# Opción 5) Cambiar permisos a un usuario: se asegura de que se ha ingresado una ruta de directorio o archivo como argumento y luego pide los permisos del propietario, grupo y otros, luego verifica si son válidos y si lo son, cambia los permisos del archivo o directorio usando el comando "chmod" y muestra los permisos actuales usando ls -la
# Explicación de las validación de permisos, el usuario introduce el permiso de propietario en la variable OWNER el permiso de grupo en la variable GROUP el permiso de otros en la variable OTHER. Después declaramos tres variables más para validar que el usuario a introducido los valores correctos, para eso utilizamos una comparación booleana, es decir verdadero o falso, en este caso si es mayor que 1 y menor que 9 asigna 1 y si no 0, eso lo hacemos con un operador ternario ? 1 : 0. Después con un simple if decimos que el valor de GROUP_OK, OWNER_OK, OTHER_OK tiene que ser igual a 1 para ejecutar la instrucción.
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
# Opción 6) Copia de seguridad del directorio de trabajo de un usuario determinado: pide el nombre del usuario para realizar la copia de seguridad y crea un archivo zip con la copia de seguridad del directorio de trabajo del usuario especificado y lo almacena en /tmp/ con el comando zip -r.
    6) echo "Copia de seguridad del directorio de trabajo de un usuario determinado."
    read -p "Nombre de usuario para realizar su copia de seguridad: " NAME_USER
    zip -r /tmp/copia_seguridad_$NAME_USER-$(date +%Y_%m_%d_%H:%M:%S).zip /home/$NAME_USER/
    echo "Se a creado una copia de seguridad del directorio /home/$NAME_USER/ y se a almacenado en /tmp/copia_seguridad_$NAME_USER-$(date +%Y_%m_%d_%H:%M:%S).zip"
    read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA;;
# Opción 7) Usuarios conectados actualmente: ejecuta el comando who para mostrar todos los usuarios conectados actualmente al sistema.
    7) echo "Usuarios conectados actualmente."
    w
    read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA;;
# Opción 8) Espacio libre en disco: ejecuta el comando df -h para mostrar el espacio libre en disco en un formato legible para humanos.
    8) echo "Espacio libre en disco."
    df -h
    read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA;;
# Opción 9) Trazar ruta: pide al usuario que ingrese una IP o un nombre de dominio, luego ejecuta el comando "traceroute" para mostrar la ruta de red desde la computadora del usuario hasta el destino especificado.
    9) echo "Trazar ruta."
    read -p "Direccion IP o dominio para treazar la ruta: " IP_DOMAIN

    # Ejecutar el comando traceroute y verificar si se ejecutó correctamente
    if traceroute $IP_DOMAIN; then
        read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA
    else
        echo "Error: no se pudo ejecutar el comando traceroute."
    fi
    read -n 1 -p "Pulsa una tecla para volver al menu: " PAUSA;;
# Opción 10) Salir: ejecuta el comando exit para salir del script.
    10) echo "Adios.";;
 esac
done
