#!/bin/bash
#把/lianxi/aa 下面的1.txt--20.txt 改为1.docx--20.docx

cd /lianxi/aa

for i in {1..20}
do
	mv $i.txt $i.docx
done
