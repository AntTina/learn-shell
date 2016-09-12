#!/bin/bash
#判断成绩的范围（成绩应为 0-100的整数）

read -p "please input your grade:" grade

#检测字母和特殊字符
if  echo $grade|egrep  "[^0-9]"  &>/dev/null
then
    echo "please input an integer"
#判断数值是否大于100
elif (( $grade >100))
then
	echo "please input integer 0 to 100"

#对0-100的成绩分类
elif (($grade >=90 && $grade<=100))
then 
	echo "excellent"
elif (($grade >=80 && $grade <=89))
then
	echo "good"
elif (($grade >=70 && $grade <=79))
then
	echo "ok" 
elif (($grade >=60 && $grade <=69)) 
then 
	echo "pass"
else 
	echo "you need to make-up"
fi


