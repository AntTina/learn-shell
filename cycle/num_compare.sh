#!/bin/bash
#比较两个数值的大小，并输出比较结果

read -p "please input two number separated by spaces: " num1 num2

result=`echo "$num1 == $num2"|bc`
result1=`echo "$num1 < $num2" |bc`

if (($result == 1))
then 
	echo "$num1 =  $num2"
elif (($result1 == 1))
then 
	echo "$num1 < $num2"
else 
	echo "$num1 > $num2"
fi
