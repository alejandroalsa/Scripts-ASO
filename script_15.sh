#!/bin/bash
clear

#---->Explicación 48
# Se obtiene el nombre de usuario activo en el sistema mediante el comando whoami, y se almacena en la variable nombre_usuario.
nombre_usuario=$(whoami)

#---->Explicación 49
# Después, se utiliza el comando grep para buscar en el archivo /etc/passwd (donde se almacenan los datos de los usuarios del sistema) la línea correspondiente al usuario activo (^$nombre_usuario: indica que se busque una línea que empiece con el nombre de usuario seguido de :), y se utiliza el comando cut para extraer la sexta columna, que corresponde al directorio de trabajo del usuario. El resultado se almacena en la variable directorio_trabajo.
directorio_trabajo=$(grep "^$nombre_usuario:" /etc/passwd | cut -d: -f6)

#---->Explicación 50
# Finalmente, se repite el mismo proceso para obtener la shell asociada al usuario, y el resultado se almacena en la variable shell.
shell=$(grep "^$nombre_usuario:" /etc/passwd | cut -d: -f7)

echo "Nombre de usuario: $nombre_usuario"
echo "Directorio de trabajo: $directorio_trabajo"
echo "Shell: $shell"
