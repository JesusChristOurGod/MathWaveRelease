#!/bin/bash
count=$1
for ((i=1;i<$count;i++))
do
processing-java --sketch=/Users/denisfadeev/Documents/Processing/projects/MathWaveRelease/scenery --variant=macos-aarch64 --run $i
echo render $i is end
done
echo "done"
