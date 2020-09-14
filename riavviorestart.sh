#!/bin/bash

if [ "$#" -eq 1 ] ; then
    	nome=$1	
    	echo "nome container già inserito: "$nome ;
elif [ "$#" -eq 0 ] ; then
	echo "inserisci nome container: "
	read -r b
	#echo $b
	nome=$b ;	
else
   	echo "errore" 
   	exit
fi




echo nome della raspberry: $nome

file=passt3.5




sudo rm -rf $file.$nome.py

#creo passt
sed 's/test2/'$nome'/g' example.py > $file.$nome.py



pass=""$file"."$nome".py"
echo $pass



echo "restarting filesystem "$nome"!"

sudo umount --force /gpio_mnt/"$nome"/sys/devices/platform/soc/3f200000.gpio
sudo umount --force /gpio_mnt/"$nome"/sys/class/gpio

sudo umount --force /gpio_mnt/"$nome"/sys/devices/platform/soc/3f200000.gpio
sudo umount --force /gpio_mnt/"$nome"/sys/class/gpio


python3 "$pass" /sys/devices/platform/soc/3f200000.gpio /gpio_mnt/"$nome"/sys/devices/platform/soc/3f200000.gpio/ &
python3 "$pass" /sys/class/gpio/ /gpio_mnt/"$nome"/sys/class/gpio/ &
