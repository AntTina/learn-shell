#!/bin/bash

read -p "Please input the prefix of user:" u_pre
read -p "Please input the number of user:" u_num
read -p "Please input the passwd for user:" u_pin

for i in `seq $u_num`
do 
  	if id $u_pre$i &>/dev/null
        then 
		echo "The $u_pre$i already exsits"
 	else 
		useradd $u_pre$i 
		echo $u_pin |passwd $u_pre$i --stdin &>/dev/null
		echo "The $u_pre$i create ok and set passwd for $u_pre$i successful"
	fi
done
echo -e "\e[31mDisplay the user information which you just create\e[0m"
tail -$u_num /etc/passwd|awk -F : '{print $1,$3,$4,$6,$7}'
