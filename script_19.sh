#!/bin/bash

clear

count_all_scripts() {
  TOTAL=0
  # Busca los directorios "home" de los usuarios en el sistema
  for HOME_DIR in /home/*; do
    if [ -d "$HOME_DIR" ]; then
      USER=$(basename "$HOME_DIR")
      # Busca los scripts de Bash del usuario actual
      COUNT=$(find "$HOME_DIR" -name "*.sh" | wc -l)
      if [ "$COUNT" -gt 0 ]; then
        echo "$USER: $COUNT scripts de Bash"
        let "TOTAL+=COUNT"
      fi
    fi
  done
  echo "En total, se encontraron $TOTAL scripts de Bash."
}

count_user_scripts() {
  read -p "Ingrese el nombre del usuario: " USER
  HOME_DIR="/home/$USER"
  if [ -d "$HOME_DIR" ]; then
    COUNT=$(find "$HOME_DIR" -name "*.sh" | wc -l)
    if [ "$COUNT" -gt 0 ]; then
      echo "$USER: $COUNT scripts de Bash."
    else
      echo "No se encontraron scripts de Bash para el usuario $USER."
    fi
  else
    echo "El usuario $USER no tiene una carpeta home."
  fi
}

# Muestra el menú de opciones
while true; do
  echo "Seleccione una opción:"
  echo "1. Contar scripts de Bash para todos los usuarios."
  echo "2. Contar scripts de Bash para un usuario específico."
  echo "3. Salir."
  read -p "Ingrese una opción (1-3): " OPTION
  clear
  case $OPTION in
    1)
      count_all_scripts
      ;;
    2)
      count_user_scripts
      ;;
    3)
      echo "Saliendo del script."
      exit
      ;;
    *)
      echo "Opción inválida. Ingrese una opción válida (1-3)."
      ;;
  esac
done
