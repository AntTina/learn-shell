#!/bin/bash

menu(){
	echo "1.Tar /var/log"
	echo "2.Assign the tar path"
	echo "3.Find by condition"
	echo "4.Exit"
}

tar_file(){
        [ -d /bak/log ]||mkdir /bak/log  -p
		tar czf /bak/log/`date +%F-%H_%M_%S`-log.tar.gz /var/log   &>/dev/null
        find /bak/log -mtime +7 -type f -exec rm -rf {} \;
}

assign_path(){
        read -p "Please input the absolute path of directory which you want to tar: " d_path
		f_name=`basename $d_path`
        [ -d /bak/`date +%F` ]||mkdir /bak/`date +%F` -p
        tar czf /bak/`date +%F`/${f_name}_`date +%H_%M_%S`.tar.gz $d_path   &>/dev/null
}

find_file(){
	read -p  "Please input the absolute path of directory which you want to find: " dir
    read -p  "Please input your condition:" condition 

	[ -d /bak/find ] ||mkdir /bak/find -p
	result=(`find $dir $condition 2>/dev/null`)
	
	if (( ${#result[@]} == 0 ))
	then
		echo "None"
	else
		for i in ${result[@]}
		do
			name=`basename $i`
			tar czf /bak/find/${name}_`date +%H_%M_%S`.tar.gz  $i  &>/dev/null
		done
	fi

}

main(){
	menu
	read -n 1 -p "Please input your choice:" choose
	echo
	case $choose in
	1)
		tar_file
		;;
	2)
		assign_path
		;;
	3)
		find_file
		;;
	4)	
		exit
		;;
	*) 
		exit
		;;
	esac
}
main

去掉绝对路径的其他方法：echo $i |awk -F / '{print $NF}'
