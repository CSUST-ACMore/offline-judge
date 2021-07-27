.PHONY : clean

check : check.sh
	./check.sh

rand.exe : rand.cc
	g++ rand.cc -o rand.exe -O2 -Wall --std=c++11

my.exe : my.cc
	g++ my.cc -o my.exe -O2 -Wall --std=c++11

check.exe : check.cc
	g++ check.cc -o check.exe -O2 -Wall --std=c++11

clean :
	-rm *.exe *.log *.in *.out *.input *.output
