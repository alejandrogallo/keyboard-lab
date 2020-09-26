all: svg

KEYBOARDS = Nammu Utu
SWITCHES = Tec Alps
SIDES = left right

KBS = $(foreach side,$(SIDES),\
				$(foreach switch,$(SWITCHES),\
					$(foreach kb,$(KEYBOARDS),\
						$(kb)-$(switch)-$(side).svg)))

define kb-rule
$(1)-$(2)-$(3).svg: Main
	./Main --$(3) --keyswitch $(2) --keyboard $(1) -o $$@
endef

$(foreach side,$(SIDES),\
		$(foreach switch,$(SWITCHES),\
				$(foreach kb,$(KEYBOARDS),\
					$(eval $(call kb-rule,$(kb),$(switch),$(side))))))


svg: $(KBS)

include deps.mk

Main: $(wildcard *.hs)

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
