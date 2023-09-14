CC = $(CROSS)gcc

PACKAGES := glib-2.0

override CFLAGS += -g -Wall -Werror -Wpointer-arith

INCLUDES = \
		-I../include \
		`pkg-config --cflags $(PACKAGES)`


LDFLAGS += -lpthread `pkg-config --libs $(PACKAGES)`

OBJECTS := \
		libdiplomado_modulo5.o

BINARIES := libdiplomado_modulo5.so

all: $(BINARIES)

### BINARIES ###
libdiplomado_modulo5.so: $(OBJECTS)
	$(CC) $(OBJECTS) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -shared -rdynamic -fPIC -Wl,-soname,$@ -lc -o $@

### OBJECTS ###
$(OBJECTS):
	$(CC) $(CFLAGS) $(CPPFLAGS) $(INCLUDES) -c ${@:.o=.c} -fPIC -o $@

clean:
	rm -f *.o *.so

install:
	install --mode=755 -dv $(DESTDIR)/lib
	install --mode=644 $(BINARIES) $(DESTDIR)/lib
