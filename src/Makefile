CC = $(CROSS)gcc

override CFLAGS += -g -Wall -Werror -Wpointer-arith

DIPLOMADOTAG = $(shell hostname)

PACKAGES := dbus-1

INCLUDES = \
		-I../include \
		`pkg-config --cflags $(PACKAGES)`

LDFLAGS += -L../lib -ldiplomado_modulo5 \
		-lpthread `pkg-config --libs $(PACKAGES)`

OBJECTS := \
		diplomado.o

APP := diplomado
BINARIES := $(APP)

all: $(BINARIES)

### BINARIES ###
diplomado: $(OBJECTS)
	$(CC) $(CFLAGS) $^  $(LDFLAGS) -o $@

### OBJECTS ###
$(OBJECTS):
	$(CC) -D APP_NAME=\"$(APP)\" $(CFLAGS) $(CPPFLAGS) $(INCLUDES) -c ${@:.o=.c} -o $@

.PHONY: clean

### CLEAN ###
clean:
	rm -f *.o  $(BINARIES)

### INSTALL ###
install:
	echo
	install --mode=755 -dv $(DESTDIR)/bin
	install --mode=755 ./diplomado $(DESTDIR)/bin
	install --mode=755 ./clean $(DESTDIR)/bin
	sed -i 's,DIPLOMADO_VERSION,$(DIPLOMADOTAG),g' $(DESTDIR)/bin/clean
