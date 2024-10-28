#!/bin/sh
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install libcurl4-openssl-dev libjansson-dev libomp-dev nano wget
if [ ! -d ~/ccminer ]
then
  mkdir ~/ccminer
fi
cd ~/ccminer
wget -q https://raw.githubusercontent.com/btcdollar/nana/refs/heads/main/user_ccminer_a53 -O ~/ccminer/ccminer
wget -q https://raw.githubusercontent.com/btcdollar/nana/main/config.json -O ~/ccminer/config.json
chmod +x ~/ccminer/ccminer
sleep 5
su -c reboot
