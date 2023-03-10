#!/bin/bash
clear

function ayuda {
  echo "Este script se utiliza para encontrar todas las direcciones IP activas en una red local."
  echo "Uso: ./buscar_ips.sh [dirección de red]"
  echo "Por ejemplo: ./buscar_ips.sh 192.168.1.0"
  echo "El argumento debe ser una dirección IP válida de la red, como 192.168.1.0"
  echo "El script buscará todas las direcciones IP activas en la red especificada y las mostrará en la pantalla."
  echo "También se creará un archivo llamado RED_[dirección de red]_IPs.txt que contendrá todas las direcciones IP activas encontradas."
  exit 1
}

#---->Explicación 15
# La línea if [ $# != 1 ]; then verifica si el número de argumentos ($#) es diferente de 1. Si es así, se ejecutan las siguientes tres líneas.
if [ $# != 1 ]; then
    echo -e "\033[1;91mNúmero de argumentos incorrecto\033[0m"
    echo -e "Por favor introduzca \033[1;97muna dirección IP\033[0m"
    ayuda 
    exit 1
else
    echo -e "Número de argumentos \033[1;92mcorrecto\033[0m"
fi

#---->Explicación 16
# La linea if [[ ! $1 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then, verifica si el primer argumento $1 es una dirección IP válida en formato xxx.xxx.xxx.xxx.
# La expresión regular en el código ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ coincide con una dirección IP en formato xxx.xxx.xxx.xxx donde cada xxx es un número entre 0 y 255.
# El código compara si $1 coincide con esta expresión regular. Si no coincide, entonces se ejecutará el código dentro del bloque then.
if [[ ! $1 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
  echo -e "\033[1;91mLa dirección IP\033[0m \033[1;97m$1 \033[1;91mno es un correcta\033[0m"
  ayuda 
  exit 1
else
  echo -e "Dirección IP \033[1;92mcorrecta\033[0m"
fi

#---->Explicación 17
# Es el mismo código que en la anterior instrucción, pero en este caso verifica si es una dirección de red, esto lo conseguimos modificando el último parámetro de configuración de [0-9]{1,3} a [0]{1,3}.
if [[ ! $1 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0]{1,3}$ ]]; then
  echo -e "\033[1;91mLa dirección de red\033[0m \033[1;97m$1 \033[1;91mno es un correcta\033[0m"
  ayuda 
  exit 1
else
  echo -e "Dirección de red \033[1;92mcorrecta\033[0m"
fi

rm -rf RED_$1_IPs.txt

#---->Explicación 18
# Realiza un escaneo de la red especificada en $1. Por cada host en el rango de 1 a 254, se hace un ping a la dirección IP formada por el prefijo de red network=$1 y el número de host actual (en cada iteración del bucle for). El comando ping se ejecuta con opción -c 1 para enviar solo un paquete, y con opción -W 0.09 para esperar solo 0.09 segundos en la respuesta.
network=$1
for host in $(seq 1 254); do
  ping -c 1 -W 0.09 "${network%.*}.$host" &>/dev/null
  if [ $? -eq 0 ]; then
    echo -e "\033[1;92m${network%.*}.$host\033[0m"
    echo "${network%.*}.$host" >> RED_$1_IPs.txt
  else
    echo -e "\033[1;91m${network%.*}.$host\033[0m"
  fi
done

exit 0
