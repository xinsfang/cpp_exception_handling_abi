CC=cc
CXX=c++
all: main

CFLAGS := -O0 -g -v
CXXFLAGS := -O0 -g -v

main: main.o throw.o
	$(CC) -o $@ -v $^
#	$(CXX) -o $@ -v $^

throw.gas: throw.cpp
	c++ -c throw.cpp -g -Wa,-adhls > throw.gas

throw.s: throw.cpp
	c++ -S throw.cpp

.PHONY: clean run
clean:
	rm -f *.o main

run: main
	./main

