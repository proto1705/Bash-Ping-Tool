#!/bin/bash

# Ping Tool
# Author : Jomon Joseph
# Version : 1.0

printf "\033c" # Clear Screen

printf $'\e[1;36m'"\n######################## Ping Tool ##############################\n\n"$'\e[0m'
printf $'\e[1;36m'"PING TOOL\n"'\e[0m'
printf $'\e[1;36m'"Author: Jomon Joseph\n"'\e[0m'
printf $'\e[1;36m'"Version: 1.0\n\n"'\e[0m'
printf $'\e[1;36m'"##################################################################\n\n"$'\e[0m'
printf "1) Enter 1 for URL/ Domain Input\n2) Enter 2 for IP Input\n"
read input


case $input in
    1)
        printf "\nEnter the Web/ Server url to ping\n"
        read url
        echo -e '\n'$'\e[0;36m'Tracing IP Address of $url$'\e[0m'
        
        # Trace the IP address using dig command
        ip=$((dig +short $url) | head -n 1)
        echo -e $'\e[0;36m'The IP Address of $url is$'\e[0m' : $'\e[1;33m'$ip$'\e[0m''\n'
        
        # Splitting the IP Address into Four parts using IFS. It splits the ip address by '.'dot into 4 parts: $1, $2, $3 and $4, here $4 is the host address.
        IFS=. ; set -- $ip

        # Assigning Host Address to the variable host
        host=$4
        

        while [ $host -le 255 ]
        do
	        ping -c 1 $1.$2.$3.$host 2>&1 >/dev/null #ping the IP address and supress the output on screen
	        if [[ $? -ne 0 ]];then #checking the response

		        echo $1.$2.$3.$host is $'\e[1;31m'offline$'\e[0m'
	        else
		        echo $1.$2.$3.$host is $'\e[1;32m'online$'\e[0m'
	        fi
            host=$(($host+1))
        done
    ;;
    
    2)
        printf "\nEnter IP Address\n"
        read ipaddress

        # Splitting the IP Address into Four parts using IFS. It splits the ip address by '.'dot into 4 parts: $1, $2, $3 and $4, here $4 is the host address.
        IFS=. ; set -- $ipaddress
        
        # Assigning Host Address to the variable host
        host=$4
        printf "\n"
        while [ $host -le 255 ]
        do
	        ping -c 1 $1.$2.$3.$host 2>&1 >/dev/null #ping the IP address and supress the output on screen
	        if [[ $? -ne 0 ]];then #checking the response

		        echo $1.$2.$3.$host is $'\e[1;31m'offline$'\e[0m'
	        else
		        echo $1.$2.$3.$host is $'\e[1;32m'online$'\e[0m'
	        fi
            host=$(($host+1))
        done
      
    ;;

    *)
        printf "Input Error\n"
    ;;
esac