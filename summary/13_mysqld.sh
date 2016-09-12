#!/bin/bash
>~/.ssh/known_hosts

if nc -z 172.16.19.89 3306 &>/dev/null
then
echo "172.16.19.89 Mysql is up,don't need to start"
else 
		echo "$(date +%F-%H_%M_%S) 172.16.19.89  Mysql is down" >>mysql_down.log 
		(service mysqld start &>/dev/null; echo "Mysql start ok")
fi

if nc -z 172.16.210.1 3306 &>/dev/null
then    
echo "172.16.210.1 Mysql is up,don't need to start"
else    
        echo "$(date +%F-%H_%M_%S) 172.16.210.1 Mysql is down" >>mysql_down.log 
		expect 13_mysqld_2.sh 
fi     
