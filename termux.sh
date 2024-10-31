#!/bin/bash
yes | pkg update
yes | pkg upgrade
yes | pkg install termux-services libjansson wget nano
mkdir ~/ccminer && cd ~/ccminer
wget -q https://raw.githubusercontent.com/btcdollar/nana/main/ccminer_a76 -O ~/ccminer/ccminer
wget -q https://raw.githubusercontent.com/btcdollar/nana/main/config.json -O ~/ccminer/config.json
chmod +x ccminer
./ccminer -c config.json
