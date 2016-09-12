#!/bin/bash 
#将用户名、主机ip、文件位置和名字、密码写入到一个文件
#执行expect_system.sh，实现传送脚本、执行脚本、传回 .csv文件

while read username host dest_file passwd
do
   expect /lianxi/expect/expect_system.sh $username $host $dest_file $passwd
done < ip_passwd.txt
