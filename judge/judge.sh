#!/bin/bash

#将RuntimeError的信息保存到Runtime.log
exec 2>Runtime.log

#编译代码，并将编译信息存到CompInfo.log
g++ rand.cpp -o rand -g -Wall > CompInfo.log 2>&1
ret_cp1=$?
g++ main.cpp -o main -g -Wall >> CompInfo.log 2>&1
ret_cp2=$?
g++ std.cpp -o std -g -Wall >> CompInfo.log 2>&1
ret_cp3=$?

#发生编译错误退出对拍，可在CompInfo.log文件查看编译报错
if [ $ret_cp1 -ne 0 ]; then
	printf "rand Compile Error\n"
	exit 0
elif [ $ret_cp2 -ne 0 ]; then
    printf "Compile Error\n"
    exit 0
elif [ $ret_cp3 -ne 0 ]; then
    printf "std Compile Error\n"
    exit 0
fi

T=10000		#对拍10000次,按需修改
i=1 		#记录对拍次数，无需修改

# 开始对拍
while [ $i -le $T ]
do
    ./rand > data.in 
	printf "Test $i: \t"
	ret_rand=$?

	start_time=$(date +%s%N)
    ./main < data.in > pt.out 
	ret_main=$?
	end_time=$(date +%s%N)
	printf "main: $(( $end_time/1000000 - $start_time/1000000 ))ms\t"

	start_time=$(date +%s%N)
    ./std < data.in > std.out 
	ret_std=$?
	end_time=$(date +%s%N)
	printf "std: $(( $end_time/1000000 - $start_time/1000000 ))ms\t"

	if [ $ret_rand -ne 0 ]; then
		printf "rand Runtime Error\n"
	elif [ $ret_main -ne 0 ]; then
		printf "Runtime Error\n"
		exit 0
	elif [ $ret_std -ne 0 ]; then
		printf "std Runtime Error\n"
		exit 0
    elif diff pt.out std.out > diff.log; then
        printf "Accepted\n"
    elif diff -B -b pt.out std.out > diff.log; then
        printf "Presentation Error\n"
		exit 0
    else
        printf "Wrong Answer\n"
		exit 0
    fi
	i=$(($i +1))
done

