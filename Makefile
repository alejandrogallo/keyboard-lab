all: Main single.svg both.svg

include deps.mk

both.svg: Main
	./$< both -o $@

single.svg: Main
	./$< single -o $@

%: %.o
	ghc --make $@

%.o %.hi: %.hs
	ghc $<

clean:
	rm *.svg *.o *.hi Main deps.mk

nix:
	nix-shell --run make

Main: deps.mk

deps.mk: Main.hs
	ghc -M $? -dep-makefile $@ -dep-suffix ''

.PHONY: nix clean all dep
