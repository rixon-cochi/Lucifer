#!/bin/bash
# InfoG v1.0
# coded by:Tech Cochi (Don't change, read the lincense!)
# Github: github.com/rixon-cochi/Lucifer/
# Instagram: lucifer_code_

banner() {
printf "\n"
printf "\e[1;77m     ::::::::::::::::::::::::::::::::::::::::::\e[0m\n"
printf "\e[1;77m       .::             .::             \e[0m\e[1;93m.::::    \e[0m\n"
printf "\e[1;77m       .::           .:              \e[0m\e[1;93m.:    .::  \e[0m\n"
printf "\e[1;77m       .::.:: .::  .:.: .:   .::    \e[0m\e[1;93m.::         \e[0m\n"
printf "\e[1;77m       .:: .::  .::  .::   .::  .:: \e[0m\e[1;93m.::         \e[0m\n"
printf "\e[1;77m       .:: .::  .::  .::  .::    .::\e[0m\e[1;93m.::   .:::: \e[0m\n"
printf "\e[1;77m       .:: .::  .::  .::   .::  .::  \e[0m\e[1;93m.::    .:  \e[0m\n"
printf "\e[1;77m       .::.:::  .::  .::     .::      \e[0m\e[1;93m.:::::    \e[0m\n"
printf "\e[1;77m     ::::::::::::::::::::::::::::::::::::::::::\e[0m\n"
printf "\n"
printf "\e[1;92m     .::.\e[0m\e[1;77m Infomation Gathering Tool - v1.0 \e[1;92m.::.\e[0m\n"
printf "\e[1;32m  .::.        Coded by Tech Cochi        .::.\e[0m\n"
printf "\n"

}


menu() {

printf "\n"                                                                   |
printf "\e[1;92m[\e[0m\e[1;77m1\e[0m\e[1;92m]\e[1;93m Website Info\e[0m          \e[1;92m[\e[0m\e[1;77m7\e[0m\e[1;92m]\e[1;93m Check DNS Leak\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m2\e[0m\e[1;92m]\e[1;93m Phone Info\e[0m            \e[1;92m[\e[0m\e[1;77m8\e[0m\e[1;92m]\e[1;93m Internet Speed test\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m3\e[0m\e[1;92m]\e[1;93m Check e-mail\e[0m          \e[1;92m[\e[0m\e[1;77m9\e[0m\e[1;92m]\e[1;93m Find ip behind Cloudflare\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m4\e[0m\e[1;92m]\e[1;93m My Info\e[0m               \e[1;92m[\e[0m\e[1;77m10\e[0m\e[1;92m]\e[1;93m Find Subdomains\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m5\e[0m\e[1;92m]\e[1;93m Check site is up/down\e[0m \e[1;92m[\e[0m\e[1;77m11\e[0m\e[1;92m]\e[1;93m Check CMS\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m6\e[0m\e[1;92m]\e[1;93m IP Tracker\e[0m            \e[1;92m[\e[0m\e[1;77m12\e[0m\e[1;92m]\e[1;93m Port Scan\e[0m\n"
printf "\n"
read -p $'\e[1;92m[*] Choose an option: \e[0m' choice


if [[ $choice == "1" ]]; then
webinfo
elif [[ $choice == "2" ]]; then
phone
elif [[ $choice == "3" ]]; then
mailchecker
elif [[ $choice == "4" ]]; then
myinfo
elif [[ $choice == "5" ]]; then
tangodown
elif [[ $choice == "6" ]]; then
iptracker
elif [[ $choice == "7" ]]; then
checkdns
elif [[ $choice == "8" ]]; then
speedtest
elif [[ $choice == "9" ]]; then
cloudflare
elif [[ $choice == "10" ]]; then
subdomain
elif [[ $choice == "11" ]]; then
checkcms
elif [[ $choice == "12" ]]; then
portscan
else

printf "\n\e[1;43m[!] Invalid option!\e[0m\n\n"
menu
fi
}

tangodown() {

read -p $'\e[1;92m[*] Site: \e[0m' ip_check

checktango=$(curl -sLi --user-agent 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31' $ip_check | grep -o 'HTTP/1.1 200 OK\|HTTP/2 200')

if [[ $checktango == *'HTTP/1.1 200 OK'* ]] || [[ $checktango == *'HTTP/2 200'* ]]; then
printf "\e[1;92m[*] Site is Up!\e[0m\n"
else
printf "\e[1;93m[*] Site is Down!\e[0m\n"
fi
}
iptracker() {
if [[ -e iptracker.log ]]; then
rm -rf iptracker.log
fi
read -p $'\e[1;92m[*] IP to Track: \e[0m' ip_tracker
IFS=$'\n'
iptracker=$(curl -s -L "www.ip-tracker.org/locator/ip-lookup.php?ip=$ip_tracker" --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31" > iptracker.log)
continent=$(grep -o 'Continent.*' iptracker.log | head -n1 | cut -d ">" -f3 | cut -d "<" -f1)

printf "\n"
hostnameip=$(grep  -o "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f7 | cut -d ">" -f2)
if [[ $hostnameip != "" ]]; then
printf "\e[1;92m[*] Hostname:\e[0m\e[1;77m %s\e[0m\n" $hostnameip
fi
##


reverse_dns=$(grep -a "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f1)
if [[ $reverse_dns != "" ]]; then
printf "\e[1;92m[*] Reverse DNS:\e[0m\e[1;77m %s\e[0m\n" $reverse_dns
fi
##


if [[ $continent != "" ]]; then
printf "\e[1;92m[*] IP Continent:\e[0m\e[1;77m %s\e[0m\n" $continent
fi
##

country=$(grep -o 'Country:.*' iptracker.log | cut -d ">" -f3 | cut -d "&" -f1)
if [[ $country != "" ]]; then
printf "\e[1;92m[*] IP Country:\e[0m\e[1;77m %s\e[0m\n" $country
fi
##

state=$(grep -o "tracking lessimpt.*" iptracker.log | cut -d "<" -f1 | cut -d ">" -f2)
if [[ $state != "" ]]; then
printf "\e[1;92m[*] State:\e[0m\e[1;77m %s\e[0m\n" $state
fi
##
city=$(grep -o "City Location:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

if [[ $city != "" ]]; then
printf "\e[1;92m[*] City Location:\e[0m\e[1;77m %s\e[0m\n" $city
fi
##

isp=$(grep -o "ISP:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $isp != "" ]]; then
printf "\e[1;92m[*] ISP:\e[0m\e[1;77m %s\e[0m\n" $isp
fi
##

as_number=$(grep -o "AS Number:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $as_number != "" ]]; then
printf "\e[1;92m[*] AS Number:\e[0m\e[1;77m %s\e[0m\n" $as_number
fi
##

ip_speed=$(grep -o "IP Address Speed:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $ip_speed != "" ]]; then
printf "\e[1;92m[*] IP Address Speed:\e[0m\e[1;77m %s\e[0m\n" $ip_speed
fi
##
ip_currency=$(grep -o "IP Currency:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

if [[ $ip_currency != "" ]]; then
printf "\e[1;92m[*] IP Currency:\e[0m\e[1;77m %s\e[0m\n" $ip_currency
fi
##
printf "\n"
rm -rf iptracker.log
}



phone() {

if [[ -e phoneinfo.txt ]]; then
rm -rf phoneinfo.txt
fi

read -p $'\e[1;92m[*] Phone (e.g.: 14158586273): \e[0m' phone

getphone=$(curl -s "apilayer.net/api/validate?access_key=43fc2577cf1cdb2eb522583eaee6ae8f&number='$phone'&country_code=&format=1" -L > phoneinfo.txt)

valid=$(grep -o 'valid\":true' phoneinfo.txt )
if [[ $valid == *'valid":true'* ]]; then


country=$(grep 'country_name\":\"' phoneinfo.txt | cut -d ":" -f2 | tr -d ',' | tr -d '\"')
location=$(grep 'location\":\"' phoneinfo.txt | cut -d ":" -f2 | tr -d ',' | tr -d '\"')
carrier=$(grep 'carrier\":\"' phoneinfo.txt | cut -d ":" -f2 | tr -d ',' | tr -d '\"')
line_type=$(grep 'line_type\":\"' phoneinfo.txt | cut -d ":" -f2 | tr -d ',' | tr -d '\"')
IFS=$'\n'
printf "\e[1;92m[*] Country:\e[0m\e[1;77m %s\e[0m\n" $country
printf "\e[1;92m[*] Location:\e[0m\e[1;77m %s\e[0m\n" $location
printf "\e[1;92m[*] Carrier:\e[0m\e[1;77m %s\e[0m\n" $carrier
printf "\e[1;92m[*] Line Type:\e[0m\e[1;77m %s\e[0m\n" $line_type

else
printf "\e[1;93m[!] Request invalid!\e[0m\n"
fi

}

webinfo() {

if [[ -e webinfo ]]; then
rm -rf webinfo
fi


read -p $'\e[1;92m[*] URL: \e[0m' site

curl -s "myip.ms/$site" -L > webinfo
##
IFS=$'\n'
ip_location=$(grep 'IP Location:' webinfo | grep -o "'cflag .*\'" | cut -d "I" -f1 | cut -d '>' -f1 | tr -d "\'" | cut -d " " -f2)

if [[ $ip_location != "" ]]; then
printf "\e[1;92m[*] IP Location:\e[0m\e[1;77m %s\e[0m\n" $ip_location
fi
##

ip_range=$(grep -o 'IP Range .*' webinfo | head -n1 | cut -d "<" -f2 | cut -d ">" -f2)

if [[ $ip_range != "" ]]; then
printf "\e[1;92m[*] IP Range:\e[0m\e[1;77m %s\e[0m\n" $ip_range
fi

##
ip_reversedns=$(grep 'IP Reverse DNS' webinfo | grep 'sval' | head -n1 | cut -d ">" -f6 | cut -d "<" -f1)

if [[ $ip_reversedns != "" ]]; then
printf "\e[1;92m[*] IP Reverse DNS:\e[0m\e[1;77m %s\e[0m\n" $ip_reversedns
fi
##
ipv6=$(grep 'whois6' webinfo | cut -d "/" -f4 | cut -d "'" -f1 | head -n1)

if [[ $ipv6 != "" ]]; then
printf "\e[1;92m[*] IPv6:\e[0m\e[1;77m %s\e[0m\n" $ipv6
fi
##
host_company=$(grep -o 'Hosting Company .*-.*.' webinfo | head -n1 | cut -d "-" -f2 | cut -d "." -f1)

if [[ $host_company != "" ]]; then
printf "\e[1;92m[*] Host Company:\e[0m\e[1;77m %s\e[0m\n" $host_company
fi
##
owner_address=$(grep -o 'Owner Address: .*' webinfo | cut -d ">" -f3 | cut -d "<" -f1)

if [[ $owner_address != "" ]]; then
printf "\e[1;92m[*] Owner Address:\e[0m\e[1;77m %s\e[0m\n" $owner_address
fi
##
hosting_country=$(grep 'Hosting Country:' webinfo | grep -o "'cflag .*\'" | cut -d "I" -f1 | cut -d '>' -f1 | tr -d "\'" | cut -d " " -f2)

if [[ $hosting_country != "" ]]; then
printf "\e[1;92m[*] Hosting Country:\e[0m\e[1;77m %s\e[0m\n" $hosting_country
fi

###
hosting_phone=$(grep -o 'Hosting Phone: .*' webinfo | cut -d "<" -f3 | cut -d ">" -f2)

if [[ $hosting_phone != "" ]]; then
printf "\e[1;92m[*] Hosting Phone:\e[0m\e[1;77m %s\e[0m\n" $hosting_phone
fi

###
hosting_website=$(grep -o 'Hosting Website: .*' webinfo | grep -o "href=.*" | cut -d "<" -f1 | cut -d ">" -f2)

if [[ $hosting_website != "" ]]; then
printf "\e[1;92m[*] Hosting Website:\e[0m\e[1;77m %s\e[0m\n" $hosting_website
fi

###
dnsNS=$(curl -s "https://dns-api.org/NS/$site" | grep -o 'value\":.*\"' | cut -d " " -f2 | tr -d '\"')
if [[ $dnsNS != "" ]]; then
printf "\e[1;92m[*] NS:\e[0m\e[1;77m %s\e[0m\n" $dnsNS
fi

###
MX=$(curl -s "https://dns-api.org/MX/$site" | grep -o 'value\":.*\"' | cut -d " " -f2 | tr -d '\"')
if [[ $MX != "" ]]; then
printf "\e[1;92m[*] MX:\e[0m\e[1;77m %s\e[0m\n" $MX
fi

if [[ -e webinfo ]]; then
rm -rf webinfo
fi
}
###

mailchecker() {

read -p $'\e[1;92m[*] Check e-mail: \e[0m' email

checkmail=$(curl -s https://api.2ip.me/email.txt?email=$email | grep -o 'true\|false')

if [[ $checkmail == 'true' ]]; then
printf "\e[1;92m[*] Valid e-mail!\e[0m\n"
elif [[ $checkmail == 'false' ]]; then
printf "\e[1;93m[!] Invalid e-mail!\e[0m\n"
fi

}

checkdns() {
IFS=$'\n'
printf "\n"
printf "\e[1;92m[*] Executing DNS Leak test \e[0m\e[1;77m[1/3]...\e[0m\n"
dns1=$(nslookup whoami.akamai.net | grep -o 'Address:.*' | sed -n '2,2p' | cut -d " " -f2)
checkdns1=$(curl -s -L "www.ip-tracker.org/locator/ip-lookup.php?ip=$dns1" --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31" > checkdns1 )
citydns1=$( grep -o "City Location:.*" checkdns1 | cut -d "<" -f3 | cut -d ">" -f2)
countrydns1=$(grep -o 'Country:.*'  checkdns1 | cut -d ">" -f3 | cut -d "&" -f1)
sleep 10
printf "\e[1;92m[*] Executing DNS Leak test \e[0m\e[1;77m[2/3]...\e[0m\n"
dns2=$(nslookup whoami.akamai.net | grep -o 'Address:.*' | sed -n '2,2p' | cut -d " " -f2)
checkdns2=$(curl -s -L "www.ip-tracker.org/locator/ip-lookup.php?ip=$dns2" --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31" > checkdns2)
citydns2=$( grep -o "City Location:.*" checkdns2 | cut -d "<" -f3 | cut -d ">" -f2)
countrydns2=$(grep -o 'Country:.*' checkdns2 | cut -d ">" -f3 | cut -d "&" -f1)
sleep 10
printf "\e[1;92m[*] Executing DNS Leak test \e[0m\e[1;77m[3/3]...\e[0m\n"
dns3=$(nslookup whoami.akamai.net | grep -o 'Address:.*' | sed -n '2,2p' | cut -d " " -f2)
checkdns3=$(curl -s -L "www.ip-tracker.org/locator/ip-lookup.php?ip=$dns3" --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31" > checkdns3)
citydns3=$( grep -o "City Location:.*" checkdns3 | cut -d "<" -f3 | cut -d ">" -f2)
countrydns3=$(grep -o 'Country:.*' checkdns3 | cut -d ">" -f3 | cut -d "&" -f1)

printf "\n\e[1;93m[*] Results:\e[0m\n"
printf "\n"
printf "\e[1;92mTest 1:\e[0m\e[1;77m %s, \e[1;92mCountry:\e[0m\e[1;77m %s,\e[0m\e[1;92m City:\e[0m\e[1;77m %s\e[0m\n" $dns1 $countrydns1 $citydns1
printf "\e[1;92mTest 2:\e[0m\e[1;77m %s, \e[1;92mCountry:\e[0m\e[1;77m %s,\e[0m\e[1;92m City:\e[0m\e[1;77m %s\e[0m\n" $dns2 $countrydns2 $citydns2
printf "\e[1;92mTest 3:\e[0m\e[1;77m %s, \e[1;92mCountry:\e[0m\e[1;77m %s,\e[0m\e[1;92m City:\e[0m\e[1;77m %s\e[0m\n" $dns3 $countrydns3 $citydns3
printf "\n"
printf "\e[1;93m[*] If you see your city your DNS is leaking\e[0m\n"
printf "\e[1;92m[*] Perform this test more than 1 time for best result\e[0m\n"
if [[ -e checkdns1 ]]; then
rm -rf checkdns1
fi
if [[ -e checkdns2 ]]; then
rm -rf checkdns2
fi
if [[ -e checkdns3 ]]; then
rm -rf checkdns3
fi
}

speedtest() {

## Speedtest-cli by Matt Martz
printf "\e[1;92m[*] Calculating your Internet Speed, please wait...\e[0m\n"
printf "\e[1;77m\n"
echo "$(curl -skLO https://git.io/speedtest.sh && chmod +x speedtest.sh && ./speedtest.sh --simple)"
printf "\e[0m\n"
if [[ -e speedtest.sh ]]; then
rm -rf speedtest.sh
fi
}

cloudflare() {


read -p $'\e[1;92m[*] Cloudflare site: \e[0m' cf_site

checkifcloudflare=$(curl -L -s "https://dns-api.org/NS/$cf_site" | grep -o 'cloudflare' | head -n1)

if [[ $checkifcloudflare == *'cloudflare'* ]]; then
checkCF=$(curl -s --request POST http://www.crimeflare.biz:82/cgi-bin/cfsearch.cgi -d "cfS=$cf_site" -L --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31" > cloudflare.log)
foundcf=$(grep -o "A direct-connect IP address was found" cloudflare.log)

if [[ $foundcf == *'A direct-connect IP address was found'* ]]; then
IFS=$'\n'
real_ip=$(grep "<font color=#c00000>" cloudflare.log | sed -n '2,2p' | cut -d "<" -f2 | cut -d ">" -f2)
printf "\e[1;92m[*] Real IP:\e[0m\e[1;77m %s\e[0m\n" $real_ip
else
cloudflare2
#printf "\e[1;92m[!] Not Found!\e[0m\n"
fi
else
printf "\e[1;93m[!] This site isnt Cloudflare\e[0m\n"
fi
if [[ -e cloudflare.log ]]; then
rm -rf cloudflare.log
fi
}

cloudflare2() {

ping -c1 "ftp.$cf_ip" 2> /dev/null > cf2
checkcf2=$(grep -o '(.*)' cf2 | cut -d " " -f1 | head -n1 | tr -d ")" | tr -d "(")

if [[ $checkcf2 != "" ]]; then
ipcf2=$(curl -s -L "www.ip-tracker.org/locator/ip-lookup.php?ip=$checkcf2" --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31" > cf2.log)
check_ipcf2=$(grep -o "ISP:.*" cf2.log | cut -d "<" -f3 | cut -d ">" -f2)

if [[ $check_ipcf2 != *'CloudFlare'* ]]; then

printf "\e[1;92m[*] IP Found:\e[0m\e[1;77m %s\e[0m\n" $checkcf2
else
printf "\e[1;93m[!] IP Not Found! %s\e[0m\n"
fi

else
printf "\e[1;93m[!] IP Not Found! %s\e[0m\n"

fi
if [[ -e cf2 ]]; then
rm -rf cf2
fi
}

subdomain() {

read -p $'\e[1;92m[*] Site: \e[0m' subdomainsite

checksubdomain=$(curl -L -s "https://www.pagesinventory.com/search/?s=$subdomainsite" > infodomain.log)
IFS=$'\n'
checksite=$(grep -o -P "domain/.{0,40}.$subdomainsite.html" infodomain.log | cut -d "." -f1 | cut -d "/" -f2)

if [[ $checksite != "" ]]; then
IFS=$'\n'
printf "\e[1;92m[*] Subdomain found:\e[0m\n"
printf "\e[1;77m%s\e[0m\n" $checksite
fi

if [[ -e infodomain.log ]]; then
rm -rf infodomain.log
fi

}

checkcms() {

read -p $'\e[1;92m[*] Site: \e[0m' urlcms

checkcms=$(curl -L -s "https://whatcms.org/APIEndpoint?key=759cba81d90c6188ec5f7d2e2bf8568501a748d752fd2acdba45ee361181f58d07df7d&url=$urlcms" > checkcms.log)
detected=$(grep -o 'Success' checkcms.log)

if [[ $detected == *'Success'* ]]; then
cms=$(grep -o '"name":.*,' checkcms.log | cut -d "," -f1 | cut -d ":" -f2 | tr -d '\"')
printf "\e[1;92m[*] CMS Found:\e[0m\e[1;77m %s\e[0m\n" $cms
fi 

many_requests=$(grep -o 'Too Many Requests' checkcms.log)
if [[ $failed = *'Too Many Requests'* ]]; then
printf "\e[1;93m[!] Too Many Requests, try later.\e[0m\n"
fi


failed=$(grep -o 'Failed: CMS or Host Not Found' checkcms.log)
if [[ $failed = *'Failed: CMS or Host Not Found'* ]]; then
printf "\e[1;93m[!] Failed: CMS or Host Not Found\e[0m\n"
fi
if [[ -e checkcms.log ]]; then
rm -rf checkcms.log
fi
}

function portrange() {
if [[ -e open.ports ]]; then
rm -rf open.ports
fi
if [[ -e ports ]]; then
rm -rf ports
fi

read -p $'\e[1;92m[*] Port Range (E.g. 1 1000): \e[0m' port_range
for x in $(seq $port_range); do echo $x >> ports; done
default_threads="10"
read -p $'\e[1;92m[*] Threads (Default: 10): \e[0m' threads
threads="${threads:-${default_threads}}"
count_ports=$(wc -l ports | cut -d " " -f1)

printf "\e[1;91m[*] Press Ctrl + C to stop\n\e[0m"
token=0
startline=1
endline="$threads"
while [ $token -lt $count_ports ]; do
IFS=$'\n'
for port in $(sed -n ''$startline','$endline'p' ports); do

IFS=$'\n'
countport=$(grep -n -x "$port" ports | cut -d ":" -f1)


let token++
printf "\e[1;77mScanning port (%s/%s)\e[0m\n" $countport $count_ports

{(trap '' SIGINT && scan=$( nc -z -v -w3 $host $port 2>&1 >/dev/null | grep -o 'open'); if [[ $scan == "open" ]]; then printf "\e[1;92m \n [*] Port Open:\e[0m\e[1;77m %s\e[0m\n\n" $port; printf "%s\n" $port >> open.ports ; fi; ) } & done; wait $!;

let startline+=$threads
let endline+=$threads

done
if [[ -e open.ports ]]; then
total=$(wc -l open.ports | cut -d " " -f1)
printf "\e[1;92m[*] Total Open ports:\e[0m\e[1;77m %s\e[0m\n" $total
printf "\e[1;77m\n"
cat open.ports
rm -rf open.ports
rm -rf ports
printf "\e[0m\n"
fi
exit 1

}

portscan() {

read -p $'\e[1;92m[*] Host: \e[0m' host
printf "\e[1;92m[*] Choose an option:\e[0m\n"
read -p $'\e[1;92m[*] \e[0m\e[1;77m1)\e[0m\e[1;92m Single Port, \e[0m\e[1;77m2)\e[0m\e[1;92m Port Range: \e[0m' choice_port

if [[ $choice_port == "1" ]]; then
read -p $'\e[1;92m[*] Port: \e[0m' single_port

check=$(nc -z -v -w3 $host $single_port 2>&1 >/dev/null | grep -o 'open')
if [[ $check == "open" ]]; then
printf "\e[1;92m[*] Open!\e[0m\n"
else
printf "\e[1;93m[*] Close!\e[0m\n"
fi
elif [[ $choice_port == "2" ]]; then
portrange
fi


}

myinfo() {
touch myinfo && echo "" > myinfo
curl "ifconfig.me/all" -s  > myinfo

my_ip=$(grep -o 'ip_addr:.*' myinfo | cut -d " " -f2)
remote_ip=$(grep -o 'remote_host:.*' myinfo | cut -d " " -f2)
printf "\e[1;92m[*] My ip:\e[0m\e[1;77m %s\e[0m\n" $my_ip
printf "\e[1;92m[*] Remote Host:\e[0m\e[1;77m %s\e[0m\n" $remote_ip
rm -rf myinfo
}
banner
menu
