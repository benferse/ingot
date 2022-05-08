.POSIX:

PREFIX = ~/.local
CC = gcc

ingot: main.o
	$(CC) main.o -lX11 -Ofast -o ingot
main.o: main.c
	$(CC) -Ofast -c main.c
clean:
	rm -f *.o *.gch ingot
install: ingot
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f ingot $(DESTDIR)$(PREFIX)/bin
	cp scripts/* $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/ingot*
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/ingot

.PHONY: clean install uninstall
