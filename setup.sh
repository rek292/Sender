#!/bin/bash
# setup ngrok

sudo wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip && unzip ngrok-stable-linux-amd64.zip && rm ngrok-stable-linux-amd64.zip
sudo chmod +x ngrok
./ngrok authtoken 1Wxj5KuPExFLwdtvYF0KPUgPVgb_6qXeckNfuKY2CL8Z5uxyr
rm setup.sh
exit
