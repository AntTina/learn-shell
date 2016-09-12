#!/bin/bash
#统计1000以内个位是十位2倍的数字的个数

for i in `seq 1000`
do
	if [[ $i = *00 ]] || [[ $i = *12 ]]||[[ $i = *24 ]]||[[ $i = *36 ]]||[[ $i = *48 ]]
	then
    	echo "$i" &>/dev/null
        ((n++))
	fi
done
echo "1000以内个位是十位2倍的数字的个数是 $n"

#其他写法
for i  in `seq -w 1000`
do
	unit=$(echo $i | cut -c4)
    ten=$(echo $i | cut -c3)
    if (( unit == ten *2))
    then
    	echo "$i"  &>/dev/null
		((n++))
	fi
done
echo "1000以内个位是十位2倍的数字的个数是 $n"
