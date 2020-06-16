# Choose your word size
WSIZE = 64
OPTLEVEL = 1
# WSIZE = 32
CC = gcc
GFLAGS = -pg 
INC = ../include
MCFLAGS = -g -Wall -O$(OPTLEVEL) -I. -I$(INC) -msse4 -fno-inline -fno-optimize-sibling-calls -mfpmath=sse
CFLAGS = $(MCFLAGS) -m$(WSIZE)
F386 = -march=i386
F686 = -march=i686

all: dictionary

dictionary: dictionary.c options.c
	$(CC) $(CFLAGS) dictionary.c options.c -o dictionary
	$(CC) $(CFLAGS) $(GFLAGS) dictionary.c options.c -o dictionary-pg
	$(CC) $(CFLAGS) -S dictionary.c

clean:
	rm -f $(PROGS) *.o *~ *.s *.exe



