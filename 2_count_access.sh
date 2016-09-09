#!/bin/bash
#对标准的apache日志文件access.log进行分析并统计出总的访问次数和每个访问ip的访问次数
#按访问次数列出前5名

all_time=`cat access.log |wc -l`
echo "The total time is $all_time"

time=(`cat access.log|awk '{print $1}'|sort|uniq -c|sort -rn|awk '{print $1}'`)
ip=(`cat access.log|awk '{print $1}'|sort|uniq -c|sort -rn|awk '{print $2}'`)

for i in ${!time[@]}
do
    echo "The ${ip[i]} access times is ${time[i]}"
done

head_5=`cat access.log|awk '{print $1}'|sort|uniq -c|sort -rn|head -5`
echo -e "\e[31mThe top 5 according to the access time\e[0m"
echo "$head_5"
