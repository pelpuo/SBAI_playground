# capstone library name (without prefix 'lib' and suffix '.so')
LIBNAME = capstone

test1: test1.o
	${CC} $< -O3 -Wall -l$(LIBNAME) -o $@

%.o: %.c
	${CC} -c $< -o $@