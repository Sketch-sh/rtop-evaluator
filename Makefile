all:
	esy b jbuilder build @install -j 8 --dev

clear:
	$(MAKE) -C build clear

toplevel: clear all
	esy b jbuilder exec -- make -C build

test: 
	cd test && npm test

ci: toplevel test

do_it_1: clear toplevel
	esy b jsoo_mkcmis re && mv re.cmis.js build
do_it: do_it_1
	$(MAKE) -C build try

.PHONY: all toplevel test ci
