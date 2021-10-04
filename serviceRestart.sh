#!/bin/bash

service_name=$1
sudo systemctl status $service_name

if [ $? -ne 0 ]; then
	`sudo systemctl  restart $service_name`
else
	echo "service is already running"
fi