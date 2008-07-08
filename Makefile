BUILDDATE = $(shell date +%Y%m%d%H%M%S)

all: build

build:
	sudo MKSQUASHFS_OPTIONS="-b 1024k" lh_build 2>&1 | tee log.$(BUILDDATE)
	mv binary.iso debian_live-binary-$(BUILDDATE).iso
	mv binary.list debian_live-binary-$(BUILDDATE).list
	mv binary.packages debian_live-binary-$(BUILDDATE).packages

.PHONY: clean

clean:
	sudo lh_clean

distclean: clean
	sudo rm -rf cache/	
	sudo rm -f *.iso *.list *.packages
	rm -f log.*
