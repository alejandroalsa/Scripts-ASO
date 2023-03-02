#!/bin/bash
clear

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
#---->Explicación 25
# El comando exec &> >(tee -a /path/to/logfile_backup.log) se utiliza en el shell de Unix/Linux para redirigir la salida estándar (stdout) y la salida de error (stderr) a un archivo de registro y, al mismo tiempo, mostrarla en la terminal.
exec &> >(tee -a /path/to/logfile_backup.log)

#---->Explicación 26
# cat /etc/passwd: Este comando muestra el contenido del archivo de sistema /etc/passwd, que es una lista de usuarios en el sistema.
# awk -F: '($3 > 999) {print $1}: Este comando utiliza awk para procesar el contenido de /etc/passwd. awk es un lenguaje de programación que permite manipular texto. La opción -F: establece el separador de campo como un dos puntos (:). La expresión ($3 > 999) dentro de awk selecciona solo las líneas en las que el tercer campo (que representa el ID de usuario (UID) de un usuario) es mayor a 999. Por último, la acción {print $1} imprime el primer campo (que representa el nombre de usuario) de cada línea seleccionada.
cat /etc/passwd | awk -F: '($3 > 999) {print $1}' | grep -v "^root$" | while read user; do
  usermod -L $user
done

#---->Explicación 27
# runlevel=$(runlevel | awk '{print $2}'): Este comando ejecuta el comando runlevel y utiliza awk para extraer el segundo campo de su salida. Este campo representa el runlevel actual del sistema y se asigna a la variable runlevel.
runlevel=$(runlevel | awk '{print $2}')
if [ $runlevel != "1" ]; then
  init 1
fi

#---->Explicación 28
# fecha=$(date +%Y%m%d_%H%M%S): Este comando asigna la fecha y hora actual en formato YYYYMMDD_HHMMSS a la variable fecha.
fecha=$(date +%Y%m%d_%H%M%S)
backup_dir="/backup"
mkdir -p $backup_dir
cat /etc/passwd | awk -F: '($3 > 999) {print $1}' | while read user; do
  home_dir=$(eval echo ~$user)
  if [ -d "$home_dir" ]; then
    zip_file="$backup_dir/bk_$user_$fecha.zip"
    zip -r $zip_file $home_dir
  fi
done

#---->Explicación 29
# cat /etc/passwd muestra el contenido del archivo /etc/passwd, que es un archivo de sistema en Unix que contiene información sobre los usuarios del sistema.
# awk -F: '($3 > 999) {print $1}' utiliza el comando awk para procesar el contenido del archivo /etc/passwd. La opción -F: establece el delimitador de campo como :. La expresión regular dentro de las llaves ($3 > 999) {print $1}indica que se deben imprimir los nombres de usuario (primer campo $1) para los cuales el tercer campo ($3) sea mayor a 999.
cat /etc/passwd | awk -F: '($3 > 999) {print $1}' | grep -v "^root$" | while read user; do
  usermod -U $user
done

reboot
