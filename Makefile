all: svg
svg: left.svg both.svg right.svg

include deps.mk

Main: $(wildcard *.hs)

both.svg: Main
	./$< both -o $@

left.svg: Main
	./$< left -o $@

right.svg: Main
	./$< right -o $@

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

lint:
	hlint *.hs

.PHONY: nix clean all dep svg lint
