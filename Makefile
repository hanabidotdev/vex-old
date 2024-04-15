OBJS=src/vex.o src/language/vl.o src/language/tok.o src/language/parse.o src/language/ast/ast.o src/type/ptr.o src/type/array.o src/type/vt.o 
TESTOBJS=src/language/vl.o src/language/tok.o src/language/parse.o src/language/ast/ast.o src/type/ptr.o src/type/array.o src/type/vt.o 
TESTS=
CC=cc
PREFIX=/usr/local
LDFLAGS=
LDLIBS=
CFLAGS=-O2 -Isrc/ -Ilib/Cuik/tb/include

all: $(OBJS) $(TESTS) vex

clean:
	rm -rf $(OBJS)
	rm -rf $(TESTS)
	rm -rf vgcore.*
	rm -rf core*
	rm -rf vex

install:
	mkdir -p $(PREFIX)
	install -m 755 vex $(PREFIX)/bin

uninstall:
	rm -f $(PREFIX)/bin/vex

src/vex.o: src/vex.c
	$(CC) -c $(CFLAGS) src/vex.c -o src/vex.o

src/language/vl.o: src/language/vl.c
	$(CC) -c $(CFLAGS) src/language/vl.c -o src/language/vl.o

src/language/tok.o: src/language/tok.c
	$(CC) -c $(CFLAGS) src/language/tok.c -o src/language/tok.o

src/language/parse.o: src/language/parse.c
	$(CC) -c $(CFLAGS) src/language/parse.c -o src/language/parse.o

src/language/ast/ast.o: src/language/ast/ast.c
	$(CC) -c $(CFLAGS) src/language/ast/ast.c -o src/language/ast/ast.o

src/type/ptr.o: src/type/ptr.c
	$(CC) -c $(CFLAGS) src/type/ptr.c -o src/type/ptr.o

src/type/array.o: src/type/array.c
	$(CC) -c $(CFLAGS) src/type/array.c -o src/type/array.o

src/type/vt.o: src/type/vt.c
	$(CC) -c $(CFLAGS) src/type/vt.c -o src/type/vt.o

vex: $(OBJS) lib/Cuik/bin/tb.a
	cd lib/Cuik/; lua build.lua -tb 
	$(CC) lib/Cuik/bin/tb.a $(OBJS) -o vex $(LDFLAGS) $(LDLIBS)
