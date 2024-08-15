#!/bin/bash
rm -rf ~/.termux/boot && rm -rf ~/ccminer && rm -rf ~/.cache && rm ncc.sh
ssh_passwd='Passw0rd!'
yes | pkg update
yes | pkg upgrade
yes | pkg install cronie termux-services libjansson wget nano screen nmap openssh
yes ${ssh_passwd} | passwd u0_a118
sshd
mkdir -p ~/.termux/boot && mkdir -p ~/ccminer && cd ~/ccminer
wget -q https://raw.githubusercontent.com/Darktron/pre-compiled/a53/ccminer -O ~/ccminer/ccminer
wget -q https://raw.githubusercontent.com/btcdollar/nana/main/start.sh -O ~/ccminer/start.sh
wget -q https://raw.githubusercontent.com/btcdollar/nana/main/config.json -O ~/ccminer/config.json
chmod +x ccminer
chmod +x start.sh
cd ~/.termux/boot
wget https://raw.githubusercontent.com/btcdollar/nana/main/boot_start -O ~/.termux/boot/boot_start
chmod x ~/.termux/boot//boot_start
cd ~
wget -q https://raw.githubusercontent.com/btcdollar/nana/main/ncc.sh -O ~/ncc.sh
chmod +x ncc.sh
mkdir ~/.cache
(crontab -l 2>/dev/null; echo "*/5 * * * * ~/ncc.sh") | crontab -
~/ccminer/start.sh
su -c reboot
