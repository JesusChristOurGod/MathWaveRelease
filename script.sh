#!/bin/bash
count=$1
paths=$(pwd)
for ((i=1;i<$count;i++))
do
processing-java --sketch=$paths/scenery --run $i
echo render $i is end
done
echo "done"
