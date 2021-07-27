#!/bin/bash

# 清空先前的日志文件
:> Runtime.log
:> CompInfo.log

#将RuntimeError的信息保存到Runtime.log
exec 2>Runtime.log

source_time=`stat -c %Y rand.cc`
exe_time=0
if [ -e rand.exe ]; then
	exe_time=`stat -c %Y rand.exe`
else
	exe_time=0
fi

if [ $exe_time -lt $source_time ]; then
	g++ rand.cc -o rand.exe -O2 -Wall --std=c++11 > CompInfo.log 2>&1
fi
ret_cp1=$?

source_time=`stat -c %Y my.cc`
if [ -e my.exe ]; then
	exe_time=`stat -c %Y my.exe`
else
	exe_time=0
fi

if [ $exe_time -lt $source_time ]; then
	g++ my.cc -o my.exe -O2 -Wall --std=c++11 >> CompInfo.log 2>&1
fi
ret_cp2=$?

source_time=`stat -c %Y check.cc`
if [ -e check.exe ]; then
	exe_time=`stat -c %Y check.exe`
else
	exe_time=0
fi

if [ $exe_time -lt $source_time ]; then
	g++ check.cc -o check.exe -O2 -Wall --std=c++11 >> CompInfo.log 2>&1
fi
ret_cp3=$?

echo "编译完成"

#发生编译错误退出对拍，可在CompInfo.log文件查看编译报错
if [ $ret_cp1 -ne 0 ]; then
	printf "rand.cc Compile Error\n"
	exit 0
elif [ $ret_cp2 -ne 0 ]; then
    printf "my.cc Compile Error\n"
    exit 0
elif [ $ret_cp3 -ne 0 ]; then
    printf "check.cc Compile Error\n"
    exit 0
fi

T=1000		#对拍 1000 次,按需修改
i=1 		#记录对拍次数，无需修改

# 开始对拍
while [ $i -le $T ]
do
    ./rand.exe > data.input 
	printf "Test $i: \t"
	ret_rand=$?

	start_time=$(date +%s%N)
    ./my.exe < data.input > my.output 
	ret_my=$?
	end_time=$(date +%s%N)
	printf "my: $(( $end_time/1000000 - $start_time/1000000 ))ms\t"

	start_time=$(date +%s%N)
    ./check.exe > check.log
	ret_check=$?
	end_time=$(date +%s%N)
	printf "check: $(( $end_time/1000000 - $start_time/1000000 ))ms\t"

	if [ $ret_rand -ne 0 ]; then
		printf "rand.exe Runtime Error\n"
		printf "请打开 rand.cc 和 data.in 以及 Runtime.log 查找错误\n"
		exit 0
	elif [ $ret_my -ne 0 ]; then
		printf "my.exe Runtime Error\n"
		printf "请打开 my.cc 和 my.out 以及 Runtime.log 查找错误\n"
		exit 0
    elif [ $ret_check -eq 0 ]; then
        printf "Accepted\n"
	elif [ $ret_check -eq 1 ]; then
        printf "Wrong Answer\n"
		printf "可以打开 data.input、my.cc、my.out 以及 check.log 查找错误\n"
		exit 0
    else
		printf "check.exe Runtime Error\n"
		printf "请打开 check.cc 和 check.log 以及 Runtime.log 查找错误\n"
		exit 0
    fi
	i=$(($i +1))
done

