
#!/bin/bash
clear 

set -x

function ayuda() {
  echo "Este script realiza las siguientes tareas:"
  echo "1. Registra la salida estándar en un archivo de registro ubicado en /path/to/logfile_backup.log"
  echo "2. Bloquea las cuentas de usuario cuyo UID sea mayor que 999, excepto la cuenta de root"
  echo "3. Cambia el nivel de ejecución del sistema a 1 si no se encuentra en el nivel 1"
  echo "4. Realiza una copia de seguridad de los directorios de inicio de los usuarios cuyo UID sea mayor que 999 en /backup en formato zip"
  echo "5. Desbloquea las cuentas de usuario cuyo UID sea mayor que 999, excepto la cuenta de root"
  echo "6. Reinicia el sistema"
  exit 1
}





# Ruta del directorio donde se guardarán las copias de seguridad
backup_dir="/backups"

# Nombre del archivo de copia de seguridad, que será la fecha actual en formato YYYY-MM-DD
backup_filename="$(date +'%Y-%m-%d').tar.gz"

# Ruta del archivo de registro de salida
logfile="/var/log/logfile_backup.log"

# Crea la carpeta de backups si no existe
if [ ! -d "$backup_dir" ]; then
  mkdir "$backup_dir"
fi

# Crea una copia de seguridad de todos los archivos del usuario
tar -czvf "$backup_dir/$backup_filename" "$HOME" 2>> "$logfile"

# Bloquea las cuentas de usuario cuyo UID sea mayor que 999, excepto la cuenta de root
for user in $(cat /etc/passwd | awk -F: '$3 > 999 { print $1 }'); do
  if [ "$user" != "root" ]; then
    zip -r "$backup_dir/$user.zip" "/home/$user" 2>> "$logfile"
    echo "Copia de seguridad de la carpeta de inicio del usuario $user realizada." >> "$logfile"
  fi
done


# Cambia el nivel de ejecución del sistema a 1 si no se encuentra en el nivel 1
if [ "$(runlevel | awk '{ print $2 }')" != "1" ]; then
  telinit 1
  echo "Nivel de ejecución cambiado a 1." >> "$logfile"
fi

# Reinicia el sistema
reboot
