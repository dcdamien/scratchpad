
TARGETS = SIM900.fp
all: $(TARGETS)

clean:
	rm $(TARGETS)

%.fp: %.m4
	m4 $< > $@

