
TARGETS = AT25DFxx1.sym GLONASHA.sym LM1117.sym SIM900.sym STM32F10xRx.sym MAX3051.sym

all: $(TARGETS)

%.sym: %.src
	tragesym $< $@

clean:
	rm $(TARGETS)
