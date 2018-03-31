.PHONY:	dlunpack clean build patch

build:	patch
	$(MAKE) -C $@

patch:	dlunpack
	bash patch.sh

dlunpack:	clean
	bash dlunpack.sh

clean:
	$(MAKE) -C build clean
	rm -f *.lzh
	rm -fr pmdwin fmgen
