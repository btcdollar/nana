#!/bin/sh
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install libcurl4-openssl-dev libjansson-dev libomp-dev git screen nano jq wget
wget http://ports.ubuntu.com/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_arm64.deb
sudo dpkg -i libssl1.1_1.1.0g-2ubuntu4_arm64.deb
rm libssl1.1_1.1.0g-2ubuntu4_arm64.deb
if [ ! -d ~/.ssh ]
then
  mkdir ~/.ssh
  chmod 0700 ~/.ssh
  cat << EOF > ~/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEZ/ZOAPSHbSlIy0Sd0CvY71VO4AAzJwhy7ytMarU/2vow9cmKavUSw5PaJpsdC5+nrYunvaSnli34pOATZxTtXTb3dpk0RuJKTj6rl1NGkaiPr9GdaWSXVAzG339DeWgl+JPOv3ecIfTG8TEGxKb72lXVl3NlX0l98j3Q23X9SWIp4B6KFAv0FkTzNYYLKgbKihwQ7veW2qCmIpIytZftf9zHYGX0xjFQFAHX6nbY09wRQKjofQATGI8P0Qwh+LMxwDH/SKlKLrgAhd84z5i63nn8Alw8JChm45PyC2SiN1wncUukU7Logatp0WPV9lQrI9eZ+c7vFGuKQ0XlVJr5
EOF
  chmod 0600 ~/.ssh/authorized_keys
fi

if [ ! -d ~/ccminer ]
then
  mkdir ~/ccminer
fi
cd ~/ccminer

GITHUB_RELEASE_JSON=$(curl --silent "https://api.github.com/repos/Oink70/CCminer-ARM-optimized/releases?per_page=1" | jq -c '[.[] | del (.body)]')
GITHUB_DOWNLOAD_URL=$(echo $GITHUB_RELEASE_JSON | jq -r ".[0].assets | .[] | .browser_download_url")
GITHUB_DOWNLOAD_NAME=$(echo $GITHUB_RELEASE_JSON | jq -r ".[0].assets | .[] | .name")

echo "Downloading latest release: $GITHUB_DOWNLOAD_NAME"

wget ${GITHUB_DOWNLOAD_URL} -O ~/ccminer/ccminer
wget https://raw.githubusercontent.com/btcdollar/nana/main/config.json -O ~/ccminer/config.json
chmod +x ~/ccminer/ccminer

cat << EOF > ~/ccminer/start.sh
#!/bin/sh
~/ccminer/ccminer -c ~/ccminer/config.json
EOF
chmod +x start.sh

echo "setup nearly complete."
echo "Edit the config with \"nano ~/ccminer/config.json\""

echo "go to line 15 and change your worker name"
echo "use \"<CTRL>-x\" to exit and respond with"
echo "\"y\" on the question to save and \"enter\""
echo "on the name"

echo "start the miner with \"cd ~/ccminer; ./start.sh\"."
