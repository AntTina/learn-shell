#!/bin/bash
#function:set password for user 
#提醒用户输入用户名，先判断用户是否存在
#接受用户输入的密码，但是密码不能为空
#若密码的长度大于等于8，而且密码里必须有数字和字母，提示密码设置成功
#如果密码不符合复杂性要求的，提示不符合要求的原因
#让用户可以连续输入3次，3次过后停止输入

read -p "Please input username: " u_name

if id $u_name &>/dev/null
then 
    for i in `seq 3`
    do 
    	read -p "Please input password: " u_pin
        if [ -z "$u_pin" ]
        then
            echo "Password can't be null,please input something"
		elif ((${#u_pin} < 8))
		then
			echo "Password length less than eight"
		elif echo $u_pin|grep "[0-9]"|grep "[a-z]"|grep "[A-Z]" &>/dev/null
		then
			echo $u_pin|passwd $u_name --stdin &>/dev/null
			echo "Change password for $u_name successful"
			break    
		else
			echo -e "\e[31mYour password is too simple\e[0m"
			echo $u_pin|grep  "[0-9]" &>/dev/null ||echo -e "There is \e[31mno Number\e[0m in the passwd"
            echo $u_pin|grep  "[a-z]" &>/dev/null ||echo -e "There is \e[31mno Lowercase\e[0m in the passwd"
            echo $u_pin|grep  "[A-Z]" &>/dev/null ||echo -e "There is \e[31mno Uppercase\e[0m in the passwd"
        fi
    done
else
    echo "$u_name doesn't exist"
fi




