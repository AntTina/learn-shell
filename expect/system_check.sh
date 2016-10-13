#!/bin/bash
#采集cpu  磁盘IO  内存的信息，并生成 .csv 文件

>system.csv
#cpu
iostat|sed -n '3p'|tr -s ' ' ','|sed  's/avg-cpu:/Avg-cpu/g'  >> system.csv
iostat|sed -n '4p'|tr -s ' ' ','  >> system.csv
echo  >> system.csv

#io
iostat -x |sed -n "6,8p"|tr -s ' :' ','  >> system.csv
echo  >> system.csv

#free mem
title=`free -m|head -1|tr -s ' ' ','`
echo "Mem$title" >> system.csv
free -m |grep "Mem"|tr -s ' Mem:' ',' >>system.csv

echo -e "\e[31mMake .csv file success\e[0m"
