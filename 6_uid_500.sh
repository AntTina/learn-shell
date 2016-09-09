#!/bin/bash

cat /etc/passwd |awk -F : '$3>500 && $3<5000{print "username: "$1,"  uid is "$3,"  gid is "$4}'
