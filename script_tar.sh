#!/bin/bash

# Registra la salida estándar en un archivo de registro ubicado en /path/to/logfile_backup.log
exec &>> /path/to/logfile_backup.log

# Bloquea las cuentas de usuario cuyo UID sea mayor que 999, excepto la cuenta de root
for user in $(awk -F: '$3 > 999 && $1 != "root" {print $1}' /etc/passwd); do
  passwd --lock $user
done

# Cambia el nivel de ejecución del sistema a 1 si no se encuentra en el nivel 1
if [[ "$(runlevel | cut -d ' ' -f 2)" != "1" ]]; then
  init 1
fi

# Realiza una copia de seguridad de los directorios de inicio de los usuarios cuyo UID sea mayor que 999 en /backup en formato tar.gz
mkdir -p /backup
for user_home in $(awk -F: '$3 > 999 {print $6}' /etc/passwd); do
  tar -czf /backup/${user_home##*/}.tar.gz $user_home
done

# Desbloquea las cuentas de usuario cuyo UID sea mayor que 999, excepto la cuenta de root
for user in $(awk -F: '$3 > 999 && $1 != "root" {print $1}' /etc/passwd); do
  passwd --unlock $user
done

# Reinicia el sistema
shutdown -r now
