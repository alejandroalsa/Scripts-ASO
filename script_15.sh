#!/bin/bash
clear

#---->Explicación 48
nombre_usuario=$(whoami)

#---->Explicación 49
directorio_trabajo=$(grep "^$nombre_usuario:" /etc/passwd | cut -d: -f6)

#---->Explicación 50
shell=$(grep "^$nombre_usuario:" /etc/passwd | cut -d: -f7)

echo "Nombre de usuario: $nombre_usuario"
echo "Directorio de trabajo: $directorio_trabajo"
echo "Shell: $shell"
