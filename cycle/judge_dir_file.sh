#!/bin/bash
#提醒用户输入文件或者文件夹的绝对路径
#判断文件或者文件夹是否存在，如果不存在给予提醒
#屏幕上输出用户输入的到底是文件还是文件夹，给予判断

read -p "please input the absolute path to files:" f_name

if [ -e $f_name ]
then 
	if [ -d  $f_name ]
	then
		echo "$f_name is a directory"
	else
		echo "$f_name is a file"
	fi
else
	echo "$f_name doesn't exist"
fi
