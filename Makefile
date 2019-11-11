.PHONY:	dlunpack clean patch

release:	build/pmdwin.dll
	rm -rf release
	mkdir release
	xdelta3 -S djw -s pmdwinbin/pmdwin.dll $< release/pmdwin.xdelta
	flips -c -b pmdwinbin/pmdwin.dll $< release/pmdwin.bps

build/pmdwin.dll:	patch
	$(MAKE) -C build

patch:	dlunpack
	bash patch.sh

dlunpack:	clean
	bash dlunpack.sh

clean:
	$(MAKE) -C build clean
#	rm -f *.lzh
	rm -fr pmdwin fmgen pmdwinbin release
