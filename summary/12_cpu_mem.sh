#!/bin/bash

echo -e "\t\e[31m*****Cpu use rate top 10*****\e[0m"
ps aux|tail -n +2|sort -rn -k3|awk '{print "Pid is "$2,"\tuse rate is "$3,"\tcommand is "$11}'|head 

echo -e "\t\e[31m*****Mem use rate top 10*****\e[0m"
ps aux|tail -n +2|sort -rn -k4|awk '{print "Pid is "$2,"\tuse rate is "$3,"\tcommand is "$11}'|head 
