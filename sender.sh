#!/bin/bash
# send any file and download file with link ngrok
# color supported

green=$'\e[0;32m'
red=$'\e[1;31m'
yellow=$'\e[1;33m'
blue=$'\e[1;34m'
cyan=$'\e[0;36m'
lightgreen=$'\e[1;32m'
white=$'\e[1;37m'
STOP="\e[0m"

service apache2 restart
clear
printf "${red}"
figlet -f small "WARNING"
printf "${STOP}"
echo ""
x=0
while [ $x = 0 ]
do
read -p "$blue[+] do you want to start ngrok? [Y/n] " ng

	case "$ng" in
n)
service apache2 stop && echo '' && exit
;;
Y)
xterm -T "Starting Ngrok" -geometry 140x24-1+0 -e "./ngrok http 80" & > /dev/null2>&1
echo ""
x=1
read -p "$yellow[+] PATH to file : " file
cp -r $file /var/www/html
echo""
NGROK_PUBLIC_URL=""
while [ -z "$NGROK_PUBLIC_URL" ]; do
  # Run 'curl' against ngrok API and extract public (using 'sed' command)
  export NGROK_PUBLIC_URL=$(curl --silent --max-time 10 --connect-timeout 5 \
                            curl http://127.0.0.1:4040/api/tunnels | \
                            sed -nE 's/.*public_url":"https:..([^"]*).*/\1/p')
  sleep 1
done

echo
echo "$cyan[*] use this link to download file => $lightgreen[ https://$NGROK_PUBLIC_URL/$(basename $file) ]"
echo ""
printf "${STOP}"
read -p "$red[*] Press [ ENTER ] to exit : " exxit
echo ""
sleep 1.5
echo "$blue[*] Restoring Files ..." | pv -qL 10
echo ""
sleep 1.5
echo "$lightgreen[*] Cleaning up ... " | pv -qL 10
echo ""
rm -rf /var/www/html/$(basename $file)
pkill ngrok
service apache2 stop
echo "$green[*] OK ..." | pv -qL 10
echo ""
sleep 0.5
exit
esac
done
