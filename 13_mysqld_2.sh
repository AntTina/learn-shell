#!/usr/bin/expect
set timeout 5
spawn ssh root@172.16.210.1  
expect {
        "(yes/no)?" {
        send "yes\n"
        expect {
        "password:" {
                send "123123\n"
        }
      }
    }
        "password:" {
                send "123123\n"}
}
expect "*$"
send "service mysqld start\n"
expect eof


       
