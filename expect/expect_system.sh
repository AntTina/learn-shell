#!/usr/bin/expect

set timeout 5
set username [lindex $argv 0]
set host [lindex $argv 1]
set dest_file [lindex $argv 2]
set passwd [lindex $argv 3]

#Transfer script
spawn scp /lianxi/expect/check.sh  $username@$host:$dest_file
expect {
	"(yes/no)?" {
		send "yes\n"
		expect {
			"password:" {
				send "$passwd\n"
			}
		}
	}
	"password:" {
		send "$passwd\n"}
}
expect eof

#Bash script
spawn ssh $username@$host bash $dest_file
expect {
    "(yes/no)?" {
        send "yes\n"
        expect {
            "password:" {
                send "$passwd\n"
            }
        }
    }
    "password:" {
        send "$passwd\n"}
}
expect eof

#远程bash脚本的时候是在用户的家目录，所以 .csv 文件在用户的家目录
#Return .csv file and use host ip to rename files
spawn scp $username@$host:/root/system.csv $host-system.csv
expect {
    "(yes/no)?" {
        send "yes\n"
        expect {
            "password:" {
                send "$passwd\n"
            }
        }
    }
    "password:" {
        send "$passwd\n"}
}
expect eof
