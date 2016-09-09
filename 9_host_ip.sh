#!/bin/bash
menu(){
	echo "1.Set hostname"
	echo "2.Set ip"
	echo "3.View ip and hostname"
	echo "4.Exit"
}

set_host(){
	read -p "please input the hostname you want to change:" h_name
        hostname $h_name
	sed -i "/HOSTNAME/c HOSTNAME=$h_name" /etc/sysconfig/network
}

check_ip(){
    read -p "please input IP address:"  ip
    while true
	do     
		if echo $ip|egrep "^([1-9]|[1-9][0-9]|1[01][0-9]|12[0-6])(\.([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])){3}$" &>/dev/null
    	then
			echo "The ip address is Class A"
  			break
		elif echo $ip |egrep "^(12[89]|1[3-8][0-9]|19[01])(\.([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])){3}$" &>/dev/null
		then
			echo "The ip address is Class B"
            break
		elif echo $ip |egrep "^(19[2-9]|2[01][0-9]|22[0-3])(\.([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])){3}$" &>/dev/null
		then 
			echo "The ip address is Class C"
            break
		else 
			read -p "Ip address is illegal,please input legal address:"  ip
		fi
    done
}
ping_ip(){
		if ping -c 1 -w 2 $ip &>/dev/null
		then 
			echo "The ip is using,please use another ip address"
		else
			/bin/cp  /etc/sysconfig/network-scripts/ifcfg-eth0  /etc/sysconfig/network-scripts/ifcfg-eth0.bak
			sed -i "/IPADDR/c IPADDR=$ip" /etc/sysconfig/network-scripts/ifcfg-eth0
			if  service network restart &>/dev/null  && [[ `ifconfig eth0|awk -F : '/inet addr/{print $2}'|awk '{print $1}'` = $ip ]]
			then 
				echo "IP change success"
			else
				echo "IP change failed"
				return 2
			fi
		fi	
}

roll_back(){
		read -p "Do you need to rollback?(y/n)" answer
		if [[ $answer = "y" ]]
		then
			echo "IP is backing"
			mv /etc/sysconfig/network-scripts/ifcfg-eth0.bak  /etc/sysconfig/network-scripts/ifcfg-eth0
            if service network restart &>/dev/null
            then
				echo "IP rollback success"
            fi
		else	
				echo "You abandon rollback"
		fi
}

view(){
	echo "The hostname is `hostname`"
	echo "The Ip is `ifconfig eth0|awk -F : '/inet addr/{print $2}'|awk '{print $1}'`"
}

main(){
	menu
	read -n1 -p "Please input your choice:" choose
	echo
	case $choose in
	1)
		set_host
		;;
	2)
		check_ip
		ping_ip
		result=$?
		if (( $result == 2 ))
		then
            roll_back
		fi
		;;
	3)
		view
		;;
	4)
		exit
		;;
	*)
		echo "please input 1-4"
		;;
	esac
}
main











