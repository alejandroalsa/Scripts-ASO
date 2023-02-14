#!/bin/bash
clear

#---->Explicación 47
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
