# capstone library name (without prefix 'lib' and suffix '.so')
# LIBNAME = capstone

# test1: test1.o
# 	${CC} $< -O3 -Wall -l$(LIBNAME) -o $@

# %.o: %.c
# 	${CC} -c $< -o $@

LIBNAME = capstone
CC = g++  # Use g++ for C++ compilation

# Target for executable
disassembler: disassembler.o
	${CC} $< -O3 -Wall -l$(LIBNAME) -o $@

# Rule for compiling C++ source files
%.o: %.cpp
	${CC} -c $< -o $@

# Rule for compiling C source files (if needed)
%.o: %.c
	${CC} -c $< -o $@