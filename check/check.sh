#!/bin/bash

#将RuntimeError的信息保存到Runtime.log
exec 2>Runtime.log

#编译代码，并将编译信息存到CompInfo.log
echo "开始编译源代码"
make rand.exe > CompInfo.log 2>&1
ret_cp1=$?
make main.exe >> CompInfo.log 2>&1
ret_cp2=$?
make check.exe >> CompInfo.log 2>&1
ret_cp3=$?
echo "编译完成，开始对拍"

#发生编译错误退出对拍，可在CompInfo.log文件查看编译报错
if [ $ret_cp1 -ne 0 ]; then
	printf "rand.cc Compile Error\n"
	exit 0
elif [ $ret_cp2 -ne 0 ]; then
    printf "main.cc Compile Error\n"
    exit 0
elif [ $ret_cp3 -ne 0 ]; then
    printf "check.cc Compile Error\n"
    exit 0
fi

T=100		#对拍10000次,按需修改
i=1 		#记录对拍次数，无需修改

# 开始对拍
while [ $i -le $T ]
do
    ./rand.exe > data.in 
	printf "Test $i: \t"
	ret_rand=$?

	start_time=$(date +%s%N)
    ./main.exe < data.in > data.out 
	ret_main=$?
	end_time=$(date +%s%N)
	printf "main: $(( $end_time/1000000 - $start_time/1000000 ))ms\t"

	start_time=$(date +%s%N)
    ./check.exe > check.log
	ret_check=$?
	end_time=$(date +%s%N)
	printf "check: $(( $end_time/1000000 - $start_time/1000000 ))ms\t"

	if [ $ret_rand -ne 0 ]; then
		printf "rand.exe Runtime Error\n"
		printf "请打开 rand.cc 和 data.in 查找错误\n"
		exit 0
	elif [ $ret_main -ne 0 ]; then
		printf "main.exe Runtime Error\n"
		printf "请打开 main.cc 和 data.out 查找错误\n"
		exit 0
    elif [ $ret_check -eq 0 ]; then
        printf "Accepted\n"
	elif [ $ret_check -eq 1 ]; then
        printf "Wrong Answer\n"
		printf "可以打开 main.cc 和 check.log 查找错误\n"
		exit 0
    else
		printf "check.exe Runtime Error\n"
		printf "请打开 check.cc 和 check.log 查找错误\n"
		exit 0
    fi
	i=$(($i +1))
done

