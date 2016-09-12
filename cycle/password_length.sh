#!/bin/bash
#用户输入的密码，统计密码长度，如果大于等于6 就输出密码安全，小于6就输出密码太短

#Remind user input the password
read -p "please input your password:" u_pin
echo
#use wildcard character
[[ "$u_pin" = ??????* ]] && echo -e "\e[32myour password  is very safe\e[0m" ||echo -e "\e[31myour password is very short\e[0m"

#use wc
len=`echo "$u_pin"|wc -L`
(($len >= 6)) && echo -e "\e[32myour password  is very safe\e[0m" ||echo -e "\e[31myour password is very short\e[0m"

#Count the length of the password
((${#u_pin} >= 6)) && echo -e "\e[32myour password  is very safe\e[0m" ||echo -e "\e[31myour password is very short\e[0m"







