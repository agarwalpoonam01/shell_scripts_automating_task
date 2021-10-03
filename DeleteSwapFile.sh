#!/bin/sh

#check fstab to have swapfile entry
grep -q "swapfile" /etc/fstab

# if the is present then remove it
if [ $? -eq 0 ]; then
        echo 'swapfile exist, removing swapfile'
        sed -i '/swapfile/d' /etc/fstab
        echo "3" > /proc/sys/vm/drop_caches
        swapoff -a
        rm -f /swapfile
        echo 'Swapfile Removed'
else
        echo 'Swapfile not found No changes made.'
fi

cat /proc/swaps

