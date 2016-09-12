#!/bin/bash

read -p "Please input the grade:" grade

if [ -z $grade ]
then 
	echo "The grade can't be null"
else
	if echo $grade |egrep "[^0-9]" &>/dev/null
	then 
		echo "Please input digit,the lowercase uppersase and sepcial char is reject"
        elif (($grade > 100 ))
	then
		echo "Please input the integer between 0 and 100"
	elif (($grade >= 90 && $grade <= 100)) 
	then
		echo "Good job,may be you can try join alibaba"
	elif (($grade >= 80 && $grade <= 89))
	then
		echo "Nice,may be you can try join tencent"
	elif (($grade >= 60 && $grade <= 79))
	then
		echo "Come on,may be you can try join facebook"
	else 
		echo "Keep on fighting,may be you can try join google"
	fi
fi
