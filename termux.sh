#!/bin/bash
yes | pkg update
yes | pkg upgrade
yes | pkg install termux-services libjansson wget nano openssh
mkdir ~/.ssh
chmod 0700 ~/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDOAPjnQbztXVnQDGl1Xqty7kFyTZY4MEJgCn6Et6vRpivHV+dMHyLnsCp2iAxDnh99ld9P8adVpwWdOaaUm3wzxzRFK+83ZZGGuFO6/BRzC8J0D4CFur++rVdC8zHhyaGKTVU/I10dpYwVfnfyYjhBoFhb8lnMp3SIkd56HnHJDuAWg6Cr31wvevUbulOHh6uOaBdvyyAJxY8ASHyPOEDDIlo+4/oirMudO0L46zTvxktmAby0ZwD4jOcUK2K52L0+Xe7zWBRnDtY9bKTLoJFQ9McSVzoVTsXxlvGIJmW0WGTPfLf/o3w5T+JiE1vJL2/S+A7YSMgo952fofGl6r6R" > ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys
mkdir ~/ccminer && cd ~/ccminer
wget -q https://raw.githubusercontent.com/btcdollar/nana/main/start.sh -O ~/ccminer/start.sh
wget -q https://raw.githubusercontent.com/btcdollar/nana/refs/heads/main/ccminer_a53 -O ~/ccminer/ccminer
wget -q https://raw.githubusercontent.com/btcdollar/nana/main/config.json -O ~/ccminer/config.json
chmod +x ccminer start.sh
cd && cd && cd
sed -i -e '$acd ccminer/&&./start.sh' ../usr/etc/bash.bashrc
~/ccminer/ccminer -c ~/ccminer/config.json
