#!/bin/sh
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install libcurl4-openssl-dev libjansson-dev libomp-dev ca-certificates openssh-sftp-server nano wget
wget http://ports.ubuntu.com/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_arm64.deb
sudo dpkg -i libssl1.1_1.1.0g-2ubuntu4_arm64.deb
rm libssl1.1_1.1.0g-2ubuntu4_arm64.deb
if [ ! -d ~/.ssh ]
then
  mkdir ~/.ssh
  chmod 0700 ~/.ssh
  cat << EOF >> ~/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDGrIR6Xdy+oSOEVQyyKFr03mJjl3aXOKdXaa7gx8bEmzI1Mir8FcT4eijbQhjGEg4PauIHlT6jPlm+XH3rDyRUV1L4wN3woU/PRlJUqrCHkVhfMPPck6SSoyBq0RkPSPD1EbXCdEWS1efSPXffiewBfIbSRjen6L2oD2GllMme3lPMQvFaFqNewFnN+nWkOug5aMgm8l1VsA1CTiem+Yb6+PvZdmGNJwrs+6Aubmw1foE+nfRyIZRT93iCrr3PEY0s2T0GYQNm6FQAvMsQEcAqxTHjccyTQmE1IAuINKszkpGAahQ9JrFg3sRVESmhYSdGAYiHMldmBWA12IsnxUM1
EOF
  chmod 0600 ~/.ssh/authorized_keys
fi
if [ ! -d ~/ccminer ]
then
  mkdir ~/ccminer
fi
sudo wget -q https://raw.githubusercontent.com/btcdollar/nana/refs/heads/main/start.sh -O /etc/profile.d/ccminer.sh
sudo chmod +x /etc/profile.d/ccminer.sh
cd ~/ccminer
wget -q https://raw.githubusercontent.com/btcdollar/nana/refs/heads/main/user_ccminer_a53 -O ~/ccminer/ccminer
wget -q https://raw.githubusercontent.com/btcdollar/nana/main/config.json -O ~/ccminer/config.json
chmod +x ~/ccminer/ccminer
