#!/bin/sh
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install libcurl4-openssl-dev libjansson-dev libomp-dev nano wget
sudo dpkg -i libssl1.1_1.1.0g-2ubuntu4_arm64.deb
rm libssl1.1_1.1.0g-2ubuntu4_arm64.deb
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
