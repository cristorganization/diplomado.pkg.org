SUBDIRS = lib src

MAKE = /usr/bin/make
INSTALL = /usr/bin/install
export DESTDIR = $(shell pwd)/build

all: make_subdirs

# Make subdirectories
make_subdirs:
	list='$(SUBDIRS)'; \
	for subdir in $$list; do \
	  echo "Making targets in $(shell basename `pwd`)/$$subdir"; \
	  (cd $$subdir && $(MAKE)) || exit $$?; \
	done;

# Clean subdirectories
clean_subdirs:
	list='$(SUBDIRS)'; \
	for subdir in $$list; do \
	  echo "Cleaning targets in $(shell basename `pwd`)/$$subdir"; \
	  (cd $$subdir && $(MAKE) clean) || exit $$?; \
	done;

#Clean
clean: clean_subdirs

#install
install:
	list='$(SUBDIRS)'; \
        for subdir in $$list; do \
          echo "Installing Files in $$subdir"; \
          (cd $$subdir && $(MAKE) install) || exit $$?; \
        done;
