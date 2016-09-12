#!/bin/bash
#查找UID大于等于500小于等于60000的用户，检查他们在 /home中拥有的 子目录或文件数量
#如果超过5个，则列出具体个数及对应的用户

u_name=`cat /etc/passwd |awk -F : '$3>=500 && $3<= 60000 {print $1}'`

for i in $u_name
do
	num=`find /home -user $i|tail -n +2|wc -l`
    if (($num >= 5 ))
    then
    	echo "$i have $num files"
    fi
done

echo -e "\e[31m*************************\e[0m"

#use array index
u_name=(`cat /etc/passwd|cut -d ':' -f1`)
u_id=(`cat /etc/passwd|cut -d ':' -f3`)

for i in ${!u_id[@]}
do 
   if ((${u_id[i]} >= 500))&&((${u_id[i]} <= 60000))
   then
   	    num=`find /home -uid ${u_id[i]}|tail -n +2 |wc -l`
        if  (($num >= 5 ))
        then
        	echo "${u_name[i]} have $num files"
		fi
    fi   
done
