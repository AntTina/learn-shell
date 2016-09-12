#!/bin/bash

read -s -p "Please input your mysql password:" u_pin
echo
#create table
mysql -uroot -p$u_pin <<EOF
create database chinaitsoft;
use chinaitsoft;
create table student (id int primary key,name varchar(10),sex varchar(6),address varchar(20),phone dec(11),grade varchar(10));
quit
EOF

#insert data
echo "*********insert data*********"
echo -e "\e[31mname,sex,address,grade please use single quotes\e[0m"
for i in `seq 3`
do 
        read -p "Please input id,name,sex,address,phone,grade:" id name sex address phone grade
  	mysql -uroot -p$u_pin  chinaitsoft -e "insert into student values($id,$name,$sex,$address,$phone,$grade);"
done

#query data
echo "*********query data*********"
echo -e "\e[31mPrompt: single condition format id=1\e[0m" 
echo -e "\e[31mPrompt: muli_condition format  id=1 and name='zhang'\e[0m"

read -p "please input your condition:" u_con
mysql -uroot -p$u_pin  chinaitsoft -e "select * from student where $u_con;"
