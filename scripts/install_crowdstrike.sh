#!/bin/bash

#installing some helper tools
sudo apt-get update && apt-get install wget

#downloading crowdstrike
sudo wget "$1"

#extract file
gzip -d  "$(basename -- $1)"

#installing crowdstike package
sudo dpkg -i *.deb

#setting up crowdstike
sudo /opt/CrowdStrike/falconctl -s --cid=$2

#starting crowdstrike falcon service
systemctl falcon-sensor start

#check status
ps -e | grep falcon-sensor