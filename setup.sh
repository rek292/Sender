#!/bin/bash
# setup ngrok

sudo wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip && sudo unzip ngrok-stable-linux-amd64.zip && sudo rm -rf ngrok-stable-linux-amd64.zip
sudo chmod +x ngrok
sudo ./ngrok authtoken 1Wxj5KuPExFLwdtvYF0KPUgPVgb_6qXeckNfuKY2CL8Z5uxyr
sudo rm -rf setup.sh
exit
