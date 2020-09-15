#!/bin/bash

if [ "$#" -eq 1 ] ; then
    	nome=$1	
    	echo "name virtual rasp: "$nome ;
elif [ "$#" -eq 0 ] ; then
	echo "name virtual rasp? "
	read -r b
	nome=$b ;	
else
   	echo "errore" 
   	exit
fi


echo "name virtual rasp: "$nome

grep -w $nome example.ini
result=$?
echo "result: " $result 
 
if [ $result -eq 0  ]; then
	echo "name in example.ini";
else 
	echo "missing name in  example.ini"; 
	exit;
fi



pass="examplenuovo.py"
echo $pass



echo "restarting filesystem "$nome"!"

sudo umount --force /gpio_mnt/"$nome"/sys/devices/platform/soc/3f200000.gpio
sudo umount --force /gpio_mnt/"$nome"/sys/class/gpio



python3 "$pass" /sys/devices/platform/soc/3f200000.gpio /gpio_mnt/"$nome"/sys/devices/platform/soc/3f200000.gpio/ $nome &
python3 "$pass" /sys/class/gpio/ /gpio_mnt/"$nome"/sys/class/gpio/ $nome &
