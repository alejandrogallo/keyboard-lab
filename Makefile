all: svg readme.org

BUILD_DIR = build/
KEYBOARDS = Nammu Utu Buzurg
SWITCHES = Tec Alps Mx
SIDES = left right

KBS = $(foreach side,$(SIDES),\
         $(foreach switch,$(SWITCHES),\
            $(foreach kb,$(KEYBOARDS),\
              $(foreach base,-without-base -with-base,\
                 $(BUILD_DIR)$(kb)-$(switch)-$(side)$(base).svg))))

EPS = $(patsubst %.svg,%.eps,$(KBS))
PDF = $(patsubst %.svg,%.pdf,$(KBS))
PNG = $(patsubst %.svg,%.png,$(KBS))


define kb-rule
$(BUILD_DIR)$(1)-$(2)-$(3)-without-base.svg: Main
	$$(info [[32mHSλ] [35m⇒[0m [36m$$@[0m)
	./$$< --$(3) --keyswitch $(2) --keyboard $(1) -o $$@

$(BUILD_DIR)$(1)-$(2)-$(3)-with-base.svg: Main
	$$(info [[32mHSλ] [35m⇒[0m [36m$$@[0m)
	./$$< --$(3) --keyswitch $(2) --keyboard $(1) --with-base -o $$@
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
	echo "** $$(echo $$kb | sed 's/-/ /g; s/.svg//; s_$(BUILD_DIR)__' )" >> $@; \
	echo "[[file:$$kb]]" >> $@; \
	done

svg: $(KBS)
eps: $(EPS)
pdf: $(PDF)
png: $(PNG)
.PHONY: svg eps pdf png

%.eps: %.svg
	$(info [33m[ink] [35m⇒[0m [36m$@[0m)
	inkscape --without-gui --export-eps=$@ $<

%.pdf: %.svg
	$(info [ink] [35m⇒[0m [36m$@[0m)
	inkscape --without-gui --export-pdf=$@ $<

%.png: %.svg
	$(info [ink] [35m⇒[0m [36m$@[0m)
	inkscape --without-gui --export-png=$@ $<

include deps.mk

Main: $(wildcard *.hs)

%: %.o
	ghc --make $@

%.o %.hi: %.hs
	ghc $<

clean:
	rm -v *.svg *.o *.hi Main deps.mk build/*

nix:
	nix-shell --run make

Main: deps.mk

deps.mk: Main.hs
	ghc -M $? -dep-makefile $@ -dep-suffix ''

lint:
	hlint *.hs

.deps/diagrams-lib/src:
	mkdir -p $(@D)
	git clone https://github.com/diagrams/diagrams-lib $(@D)

.deps/linear/src:
	mkdir -p $(@D)
	git clone https://github.com/ekmett/linear $(@D)

.deps/implicit/src:
	mkdir -p $(@D)
	git clone https://github.com/colah/ImplicitCAD $(@D)

tags TAGS: .deps/diagrams-lib/src \
           .deps/linear/src \
           .deps/implicit/src \
           $(wildcard *.hs)
	ctags $?
	ctags -e $?

.PHONY: nix clean all dep svg lint verbose eps

verbose: VERBOSE=5
ifndef VERBOSE
.SILENT:
endif
