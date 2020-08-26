
all: single.svg both.svg

both.svg: Main
	./$< both -o $@

single.svg: Main
	./$< single -o $@

%: %.hs
	ghc $<

clean:
	rm *.svg *.o *.hi Main
