#!/bin/bash

#installing some helper tools
sudo apt-get update && apt-get install wget

#downloading crowdstrike
sudo wget "$0"

#extract file
gzip -d  "$(basename -- $0)"

#installing crowdstike package
sudo dpkg -i *.deb

#setting up crowdstike
sudo /opt/CrowdStrike/falconctl -s --cid=$1

#starting crowdstrike falcon service
systemctl falcon-sensor start

#check status
ps -e | grep falcon-sensor