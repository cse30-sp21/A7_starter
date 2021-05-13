EXE = swlife
OBJS = doRow.o nGetIndex.o
LIBS = -lcse30liferv -lcse30life
CC = gcc 
CFLAGS := -O0 -g --std=gnu99 -L/home/linux/ieng6/cs30sp21/public/local/arm/lib

.PHONY: clean

$(EXE) : $(OBJS) 
	gcc -o $@ $(CFLAGS) $(OBJS) $(LIBS)

nGetIndex.o : nGetIndex.c nGetIndex.h

doRow.o : doRow.S
	gcc -c $(CFLAGS) -gstabs+ doRow.S

clean :
	rm -f $(OBJS)
	rm $(EXE)

