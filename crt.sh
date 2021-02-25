#!/bin/bash
#
# crt.sh sub-domain check by 1N3@CrowdShield
# https://crowdshield.com 
#

OKBLUE='\033[94m'
OKRED='\033[91m'
OKGREEN='\033[92m'
OKORANGE='\033[93m'
RESET='\e[0m'
TARGET="$1"

if [ -z $TARGET ]; then
	echo -e "$OKRED            _         _     $RESET"
	echo -e "$OKRED   ___ _ __| |_   ___| |__  $RESET"
	echo -e "$OKRED  / __| '__| __| / __| '_ \ $RESET"
	echo -e "$OKRED | (__| |  | |_ _\__ \ | | |$RESET"
	echo -e "$OKRED  \___|_|   \__(_)___/_| |_|$RESET"
  	echo ""
	echo -e "$OKRED [+] by 1N3@CrowdShield$RESET"
	echo -e "$OKRED [+] https://crowdshield.com$RESET"
	echo -e "$OKRED [-] Usage: crt.sh <target>$RESET"
	exit
fi

if [[ $TARGET = "--help" ]]; then
	echo -e "$OKRED            _         _     $RESET"
	echo -e "$OKRED   ___ _ __| |_   ___| |__  $RESET"
	echo -e "$OKRED  / __| '__| __| / __| '_ \ $RESET"
	echo -e "$OKRED | (__| |  | |_ _\__ \ | | |$RESET"
	echo -e "$OKRED  \___|_|   \__(_)___/_| |_|$RESET"
  	echo ""
	echo -e "$OKRED [+] by 1N3@CrowdShield$RESET"
	echo -e "$OKRED [+] https://crowdshield.com$RESET"
	echo -e "$OKRED [-] Usage: crt.sh <target>$RESET"
	exit
fi

echo -e "$OKRED            _         _     $RESET"
echo -e "$OKRED   ___ _ __| |_   ___| |__  $RESET"
echo -e "$OKRED  / __| '__| __| / __| '_ \ $RESET"
echo -e "$OKRED | (__| |  | |_ _\__ \ | | |$RESET"
echo -e "$OKRED  \___|_|   \__(_)___/_| |_|$RESET"
echo ""
echo -e "$OKRED [+] by 1N3@CrowdShield$RESET"
echo -e "$OKRED [+] https://crowdshield.com$RESET"
echo -e "$OKRED + -- ----------------------------=[Gathering Certificate Subdomains]=-------- -- +$RESET"
curl -s https://crt.sh/?q=%25.$TARGET > /tmp/curl.out
cat /tmp/curl.out | grep $TARGET | grep TD | sed -e 's/<//g' | sed -e 's/>//g' | sed -e 's/TD//g' | sed -e 's/\///g' | sed -e 's/ //g' | sed -n '1!p' | sort -u > $TARGET-crt.txt
cat $TARGET-crt.txt
echo -e "$OKRED [+] Domains saved to: $TARGET-crt.txt"
echo -e "$OKRED + -- ----------------------------=[Done!]=----------------------------------- -- +$RESET"
