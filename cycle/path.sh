#!/bin/bash
#查找用户的PATH环境变量中每个目录下有多少个文件
#要求判断目录是否存在


for i in $(echo $PATH |tr ':' ' ')
do  
	if [ -d $i ]
    then
		num=`find $i -type f |wc -l`
	    echo "$i has $num files"
    else
		echo "$i isn't exist"
	fi
done

#use array
all_path=(`echo $PATH |tr ':' ' '`)

for i in ${all_path[@]}
do  
	if [ -d $i ]
    then
		num=`find $i -type f |wc -l`
	    echo "$i has $num files"
    else
		echo "$i isn't exist"
	fi
done
