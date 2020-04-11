#!/bin/bash
# InfoG v1.0
# coded by Tech Cochi (Don't change, read the lincense!)
# Github: https://github.com/cyberkallan/raavanan.infog
# Instagram: lucifer_code_
# YouTube:Tech Cochi

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
printf "\e[1;77m     ::::::::::::::::::::::::::::::::::::::::::lucifer\e[0m\n"
printf "\n"
printf "\e[1;92m     .::.\e[0m\e[1;77m Infomation Gathering Tool - v1.0 \e[1;92m.::.\e[0m\n"
printf "\e[1;32m  .::.        Recoded by Tech Cochi        .::.\e[0m\n"
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
prin
