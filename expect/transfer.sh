#!/bin/bash

while read host
do
  	expect /lianxi/expect/expect.sh $host
done <host.txt
