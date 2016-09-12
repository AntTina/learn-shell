#!/bin/bash
#猜商品的价格，猜高猜低都要给与提示
#猜对时退出脚本，1次猜对天才，2-10 聪明，11-20 一般般
#只允许猜20次，20次机会用完还没猜中给予提醒

price=$((RANDOM % 1000))
time=1
echo -e "\e[32mprice is between 0 and 999,guess it\e[0m"

while (( $time <= 20))
do 
        read -p "please input a number:" num
		if ((num == $price))
		then 
			echo "you guess it,the actual price is $price"
			if (($time == 1))
			then
				echo -e "\e[31mtotal guess is $time time(s),you are genius\e[0m"
			elif (($time >1 && $time<=10))
			then
				echo -e "\e[31mtotal guess is $time time(s),you are so clever\e[0m"
			else
				echo -e "\e[31mtotal guess is $time time(s),you are just so so\e[0m"
			fi
			exit
        elif ((num > $price))
		then
			echo "your answer is greater than it"
		else ((num < $price))
			echo "your answer is less than it"
        fi
        ((time ++))
done
echo "Already guess 20 times,No chance"

