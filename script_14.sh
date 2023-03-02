#!/bin/bash
clear

#---->Explicación 47
# En este script, se utiliza el comando date para obtener la hora actual del sistema en formato de 24 horas. Luego, se compara esa hora con las horas del día, tarde y noche para determinar qué mensaje mostrar. El operador -ge significa mayor o igual que, y el operador -lt significa menor que. Por lo tanto, la primera condición se cumple si la hora actual es mayor o igual que 6 y menor que 12, lo que significa que es de día. La segunda condición se cumple si la hora actual es mayor o igual que 12 y menor que 20, lo que significa que es de tarde. Si ninguna de las condiciones anteriores se cumple, entonces es de noche.
hora=$(date +%H)

if [ $hora -ge 6 ] && [ $hora -lt 12 ]
then
    echo "Buenos días"
elif [ $hora -ge 12 ] && [ $hora -lt 20 ]
then
    echo "Buenas tardes"
else
    echo "Buenas noches"
fi
