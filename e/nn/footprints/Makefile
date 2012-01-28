
TARGETS = SIM900.fp NT-G2-001.fp UX60-MB-5ST.fp sim-holder.fp kx-12b.fp
all: $(TARGETS)

clean:
	rm $(TARGETS)

%.fp: %.m4
	m4 $< > $@

