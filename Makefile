all: build

build:
	BUILDDATE=`date +%Y%m%d-%H%M%S`
	sudo lh_build 2>&1 | tee log.$(BUILDDATE)
	mv binary.iso debian_live-binary-$(BUILDDATE).iso
	mv binary.list debian_live-binary-$(BUILDDATE).list
	mv binary.packages debian_live-binary-$(BUILDDATE).packages

clean:
	sudo lh_clean
	sudo rm *.iso *.list *.packages

distclean: clean
	sudo rm -rf cache/	
