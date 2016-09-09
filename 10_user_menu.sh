#!/bin/bash

echo "1.Create user"
echo "2.Delete user"
echo "3.Query user information"
echo "4.Reset user's password"
echo "5.Modify user's information"
echo "6.Exit"

while true
do
read -n1 -p "Please input your choice:" choose
echo
case $choose in 
1)
	read -p "please input username which you want to add:" u_name
	if id $u_name &>/dev/null
	then 
		echo "The user $u_name already exist"
	else
		(useradd $u_name;echo "The user $u_name create ok")
	fi
	;;
2)
	read -p "please input username which you want to del:" u_name
	if id $u_name &>/dev/null
        then
		read -p  "Notice!!Are you sure you want to delete $u_name(yes/no)?" answer
		if [[ $answer = "yes" ]]
		then
			(userdel -r $u_name;echo "The user $u_name delete ok")
		else
			echo "You abandon delete the user $u_name "
		fi
	else
		echo "The user $u_name isn't exist"
        fi
        ;;
3)
	read -p "please input username which you want to query:" u_name
        if id $u_name &>/dev/null
        then
		info=`cat /etc/passwd|egrep "^$u_name:"`
		echo "The user $u_name information are $info"
	 else
                echo "The user $u_name isn't exist"
	fi
	;;
4)
	read -p "please input username which you want to reset password:" u_name
	read -p "please input the password:" u_pin
	if id $u_name &>/dev/null
        then
                echo $u_pin | passwd $u_name --stdin &>/dev/null
	 else
                echo "The user $u_name isn't exist"
        fi
	;;
		
5)
	read -p "please input username which you want to modify:" u_name
        
  	if id $u_name &>/dev/null
        then  
		read -p "You can choose modify uid gid homedir shell:" m_user  
                if [[ $m_user == "uid" ]]
		then
			read -p "Please input  uid" u_id
			usermod -u $u_id  $u_name
		elif [[ $m_user == "gid" ]]
		then
			read -p "Please input  gid" g_id
			usermod -g $g_id $u_name
		elif [[ $m_user == "homedir" ]]
		then
			read -p "Please input homedir" h_dir
			usermod -d $h_dir $u_name 
		else
			 read -p "Please input shell" s_hell
			 usermod -s $s_hell $u_name
		fi
	 else
                echo "The user $u_name isn't exist"
        fi
        ;;
6)
	exit
	;;
*)
	exit
	;;
esac
done



















