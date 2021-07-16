#!/bin/bash

# run as :
# $1 < $2 > $3

eps=1000000
start_time=$(date +%s%N)

if [ $# -lt 1 ]; then
    echo "no parameter"
	exit 1
elif [ $# -eq 1 ]; then
	$1
elif [ $# -eq 2 ]; then
	$1 < $2
elif [ $# -eq 3 ]; then
	$1 < $2 > $3
else
	echo "too much parameter"
	exit 2
fi

end_time=$(date +%s%N)
printf "test: $(($end_time / $eps - $start_time / $eps)) ms\t"
