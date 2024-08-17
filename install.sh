#!/bin/sh
rm -rf ~/.termux && rm -rf ~/ccminer && rm -rf ~/.cache && rm ~/ncc.sh
yes | pkg update
yes | pkg upgrade
yes | pkg install cronie termux-services libjansson wget nano screen nmap
mkdir -p ~/.termux/boot
mkdir -p ~/ccminer
mkdir ~/.cache
wget -q https://raw.githubusercontent.com/Darktron/pre-compiled/a53/ccminer -O ~/ccminer/ccminer
wget -q https://raw.githubusercontent.com/btcdollar/nana/main/start.sh -O ~/ccminer/start.sh
wget -q https://raw.githubusercontent.com/btcdollar/nana/main/config.json -O ~/ccminer/config.json
wget -q https://raw.githubusercontent.com/btcdollar/nana/main/boot_start -O ~/.termux/boot/boot_start
wget -q https://raw.githubusercontent.com/btcdollar/nana/main/ncc.sh -O ~/ncc.sh
chmod +x ~/ccminer/ccminer
chmod +x ~/ccminer/start.sh
chmod +x ~/.termux/boot/boot_start
chmod +x ~/ncc.sh
(crontab -l 2>/dev/null; echo "*/5 * * * * ~/ncc.sh") | crontab -
~/ccminer/start.sh
su -c reboot
