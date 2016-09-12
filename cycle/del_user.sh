#!/bin/bash
#提示输入需要删除的用户名前缀，如果用户名前缀为空或者空格，就显示"请输入合法用户名前缀"，然后退出脚本
#每删除一个用户，要显示"用户已经成功被删除"。如果没有可以删除的用户，就显示"以用户前缀开头的用户不存在"
#最后要显示删除的用户总数是"一共新建的用户数：数目"
#不能删除管理员或者系统用户(UID小500或者大于60000)



read -p "please input user prefix:" u_pre

del=`cat /etc/passwd |grep "^$u_pre"|cut -d: -f1,3|tr ':' ' '`
n=0
if [ -z "$u_pre" ]
then
    echo "please input legal user prefix"
else  
while read user uid
do 
	if id $user &>/dev/null
    then
         if (($uid >500 && $uid <=60000))
         then
         	 userdel -r $user &&  echo "delete user $user success" &&((n++))
		 else
             echo "$user is system user can't be deleted"
         fi
     else
          echo "$user is not exist"
     fi
done <<EOF
$del
EOF

echo -e "\e[31mTotal number of delete user is $n\e[0m"
fi

