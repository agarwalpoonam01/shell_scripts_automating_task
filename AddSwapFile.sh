#!/bin/sh

#check for command line argument size of swap file
if [ "$1" == '' ];then
	echo 'enter swapfile size as argument, eg. sh swapfile.sh 40'
	exit 1
fi
#Input of swap memory size in command line arguments in Megabytes
swapsize=$1

#check fstab to have swapfile entry
grep -q "swapfile" /etc/fstab


#Creating swapfile
if [ $? -ne 0 ]; then
	echo 'swapfile not found. Adding swapfile.'
	dd if=/dev/zero of=/swapfile bs=1M count=${swapsize}
	chmod 600 /swapfile
	mkswap /swapfile
	swapon /swapfile
	echo '/swapfile none swap defaults 0 0' >> /etc/fstab
else
	echo 'Swapfile is already present'
fi


cat /proc/swaps
