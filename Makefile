all: svg readme.org

BUILD_DIR = build/
KEYBOARDS = Nammu Utu
SWITCHES = Tec Alps Mx
SIDES = left right

KBS = $(foreach side,$(SIDES),\
         $(foreach switch,$(SWITCHES),\
            $(foreach kb,$(KEYBOARDS),\
               $(BUILD_DIR)$(kb)-$(switch)-$(side).svg)))

define kb-rule
$(BUILD_DIR)$(1)-$(2)-$(3).svg: Main
	./Main --$(3) --keyswitch $(2) --keyboard $(1) -o $$@
endef

$(foreach side,$(SIDES),\
   $(foreach switch,$(SWITCHES),\
      $(foreach kb,$(KEYBOARDS),\
         $(eval $(call kb-rule,$(kb),$(switch),$(side))))))

readme.org: $(KBS)
	sed -i '/\* Examples/,$$ { d }' $@
	echo "* Examples" >> $@
	for kb in $(KBS); do \
		[[ $$kb == *right* ]] && continue; \
		echo "** $$(sed 's/-/ /g; s/.svg//; s_$(BUILD_DIR)__' <<<$$kb)" >> $@; \
		echo "[[file:$$kb]]" >> $@; \
	done

svg: $(KBS)

include deps.mk

Main: $(wildcard *.hs)

%: %.o
	ghc --make $@

%.o %.hi: %.hs
	ghc $<

clean:
	rm *.svg *.o *.hi Main deps.mk build/*

nix:
	nix-shell --run make

Main: deps.mk

deps.mk: Main.hs
	ghc -M $? -dep-makefile $@ -dep-suffix ''

lint:
	hlint *.hs

.PHONY: nix clean all dep svg lint
