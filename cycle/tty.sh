#!/bin/bash
#给登录到当前主机的所有非root用户终端发送一句话“用户名: Hi，I’m Root!”

dest_user=`who | grep -v ^root | tr -s ' ' | cut -d ' ' -f1,2`
while read user tty
do
	echo "$user : Hi , I'm Root!" > /dev/$tty
done <<EOF
$dest_user
EOF
