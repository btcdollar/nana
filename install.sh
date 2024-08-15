#!/bin/bash
ssh_passwd='Passw0rd!'
yes | pkg update
yes | pkg upgrade
yes | pkg install cronie termux-services libjansson wget nano screen nmap openssh > /dev/null 2>&1
yes ${ssh_passwd} | passwd u0_a118
sshd
mkdir ~/.termux/boot && mkdir ~/ccminer && cd ~/ccminer
echo -e "${R}-> ${NC}Creating Miner & Boot Folders: ${LG}COMPLETE${NC}"
wget https://raw.githubusercontent.com/Darktron/pre-compiled/a53/ccminer
wget https://raw.githubusercontent.com/btcdollar/nana/main/start.sh
wget https://raw.githubusercontent.com/btcdollar/nana/main/config.json 
chmod +x ccminer start.sh
cd ~/.termux/boot
wget https://raw.githubusercontent.com/btcdollar/nana/main/boot_start
chmod -R 777 ~/.termux/boot
cd ~
rm ncc.sh
wget https://raw.githubusercontent.com/btcdollar/nana/main/ncc.sh
chmod 777 ncc.sh
mkdir ~/.cache
(crontab -l 2>/dev/null; echo "*/5 * * * * ~/ncc.sh") | crontab -
~/ccminer/start.sh
su -c reboot
