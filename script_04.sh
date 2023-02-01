#!/bin/bash
clear

#---->Explicación 15
if [ $# != 1 ]; then
    echo -e "\033[1;91mNúmero de argumentos incorrecto\033[0m"
    echo -e "Por favor introduzca \033[1;97muna dirección IP\033[0m"
    exit
else
    echo -e "Número de argumentos \033[1;92mcorrecto\033[0m"
fi

#---->Explicación 16
if [[ ! $1 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
  echo -e "\033[1;91mLa dirección IP\033[0m \033[1;97m$1 \033[1;91mno es un correcta\033[0m"
  exit
else
  echo -e "Dirección IP \033[1;92mcorrecta\033[0m"
fi

#---->Explicación 17
if [[ ! $1 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0]{1,3}$ ]]; then
  echo -e "\033[1;91mLa dirección de red\033[0m \033[1;97m$1 \033[1;91mno es un correcta\033[0m"
  exit
else
  echo -e "Dirección de red \033[1;92mcorrecta\033[0m"
fi

rm -rf RED_$1_IPs.txt

#---->Explicación 18
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
