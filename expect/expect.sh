#!/usr/bin/expect

set timeout 5
set host [lindex $argv 0]

spawn scp /lianxi/expect/system_check.sh root@$host:/root 
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
expect eof

spawn ssh root@$host bash /root/system_check.sh
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
expect eof

spawn scp root@$host:/root/system.csv $host-system.csv
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
                send "123123\n" }
}
expect eof






















