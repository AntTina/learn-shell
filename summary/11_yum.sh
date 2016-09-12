#!/bin/bash

[ -d /yum ] ||mkdir /yum
mount /dev/cdrom /yum &>/dev/null

cat >/etc/yum.repos.d/local.repo <<EOF
[local]
name=local_yum
baseurl=file:///yum
enabled=1
gpgcheck=0
EOF

[ -d /etc/yum.repos.d/bak ]||(mkdir /etc/yum.repos.d/bak;mv CentOS * /etc/yum.repos.d/bak)

if which mysql &>/dev/null
then
	echo "Mysql already exsit"
else 
	(yum install mysql mysql-server -y &>/dev/null; echo "Mysql install ok")
fi

if service mysqld start  &>/dev/null 
then
	echo "Start mysql service ok"
fi
echo "service mysqld restart" >>/etc/rc.local

 

