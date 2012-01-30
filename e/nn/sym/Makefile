
TARGETS = AT25DFxx1.sym NT-G2-001.sym LD1117.sym SIM900.sym STM32F10xRx.sym MAX3051.sym CAY17.sym CAY16.sym

all: $(TARGETS)

%.sym: %.src
	tragesym $< $@

clean:
	rm $(TARGETS)
