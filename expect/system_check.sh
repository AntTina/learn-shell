#!/bin/bash

>system.csv
#cpu info
iostat|sed -n '3,4p'|tr -s ' :' ','|sed 's/avg-cpu/Avg-cpu/g' >>system.csv
echo >>system.csv

#io info
iostat -x|sed -n '6,8p'|tr -s ' :' ','  >>system.csv
echo >>system.csv

#mem info
title=`free -m|sed -n '1p'|tr -s ' ' ','`
echo "Mem$title"  >>system.csv
free -m|sed -n '2p'|tr -s ' :' ','|sed 's/Mem//g' >>system.csv
