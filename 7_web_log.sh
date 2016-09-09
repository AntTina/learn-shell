#!/bin/bash

#Use array
time=(`cat web.log|awk -F "/" '{print $3}'|sort |uniq -c|sort -rn|awk '{print $1}'`)
web=(`cat web.log|awk -F "/" '{print $3}'|sort |uniq -c|sort -rn|awk '{print $2}'`)

for i in ${!time[@]}
do 
	echo "${time[i]} ${web[i]}"
done

#use sed
cat web.log|awk -F / '{print $3}'|sort|uniq -c |sort -rn|sed -r 's/\s+//'
