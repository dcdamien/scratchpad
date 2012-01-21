
TARGETS = SIM900.fp GLONASHA.fp UX60-MB-5ST.fp sim-holder.fp
all: $(TARGETS)

clean:
	rm $(TARGETS)

%.fp: %.m4
	m4 $< > $@

