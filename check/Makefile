.PHONY : clean

check : rand.exe main.exe check.exe
	./check.sh

rand.exe : rand.cc
	g++ rand.cc -o rand.exe -O2 -Wall --std=c++11

main.exe : main.cc
	g++ main.cc -o main.exe -O2 -Wall --std=c++11

check.exe : check.cc
	g++ check.cc -o check.exe -O2 -Wall --std=c++11

clean :
	-rm *.exe *.log *.in *.out
