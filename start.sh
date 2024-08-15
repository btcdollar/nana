#!/bin/sh
screen -S CCminer -X quit
screen -wipe
screen -dmS CCminer ~/ccminer/ccminer -c ~/ccminer/config.json
