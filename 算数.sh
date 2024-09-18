#!/bin/bash

if [ ! -f "input.txt" ]; then
   echo "输入文件 input.txt 不存在"
   exit 1
fi

sum=0
count=0

while IFS= read -r line; do
    if [[ $line =~ ^[0-9]+$ ]]; then
        sum=$((sum + line))
        count=$((count+1))

    fi

done < "input.txt"

average=$(echo "scale=2; $sum/$count" |bc)

output=$(printf "{"sum": %d,"average": %.2f}" $sum $average)
echo $output > output.json

echo "总和与平均值已经输出至 output.json"

