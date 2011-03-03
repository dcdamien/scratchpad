
# This Makefile is based on the one from lpc1343-codebase
# http://www.microbuilder.eu/Projects/LPC1343ReferenceDesign/LPC1343CodeBase.aspx

LPC1343CODEBASE = ~/e/lpc1343/lpc1343codebase

CPU_TYPE = cortex-m3
FLASH = 32K
SRAM = 8K

# For USB HID support the LPC134x reserves 384 bytes from the sram,
# if you don't want to use the USB features, just use 0 here.
SRAM_USB = 384


VPATH   =
OBJS    = main.o
OUTFILE = firmware


##########################################################################
# GNU GCC compiler prefix and location
##########################################################################

AS      = arm-none-eabi-gcc
CC      = arm-none-eabi-gcc
LD      = arm-none-eabi-gcc
OBJCOPY = arm-none-eabi-objcopy
LPCRC   = ${LPC1343CODEBASE}/lpcrc


##########################################################################
# GNU GCC compiler flags
##########################################################################
ROOT_PATH = .
INCLUDE_PATHS = -I$(ROOT_PATH) -I$(ROOT_PATH)/project


##########################################################################
# Startup files
##########################################################################

LD_PATH   = ${LPC1343CODEBASE}/lpc1xxx
LD_SCRIPT = $(LD_PATH)/linkscript.ld
LD_TEMP   = memory.ld

VPATH += $(LD_PATH)
OBJS  += LPC13xx_handlers.o LPC1xxx_startup.o


##########################################################################
# Compiler settings, parameters and flags
##########################################################################

CFLAGS  = -c -g -Os $(INCLUDE_PATHS) -Wall -mthumb -ffunction-sections -fdata-sections -fmessage-length=0 -mcpu=$(CPU_TYPE) -DTARGET=LPC13xx -fno-builtin
ASFLAGS = -c -g -Os $(INCLUDE_PATHS) -Wall -mthumb -ffunction-sections -fdata-sections -fmessage-length=0 -mcpu=$(CPU_TYPE) -D__ASSEMBLY__ -x assembler-with-cpp
LDFLAGS = -nostartfiles -mthumb -Wl,--gc-sections
OCFLAGS = --strip-unneeded


##########################################################################
# Make targets
##########################################################################

all: firmware

%.o : %.c
	$(CC) $(CFLAGS) -o $@ $<

%.o : %.s
	$(AS) $(ASFLAGS) -o $@ $<

firmware: $(OBJS) $(SYS_OBJS)
	-@echo "MEMORY" > $(LD_TEMP)
	-@echo "{" >> $(LD_TEMP)
	-@echo "  flash(rx): ORIGIN = 0x00000000, LENGTH = $(FLASH)" >> $(LD_TEMP)
	-@echo "  sram(rwx): ORIGIN = 0x10000000+$(SRAM_USB), LENGTH = $(SRAM)-$(SRAM_USB)" >> $(LD_TEMP)
	-@echo "}" >> $(LD_TEMP)
	-@echo "INCLUDE $(LD_SCRIPT)" >> $(LD_TEMP)

	$(LD) $(LDFLAGS) -T $(LD_TEMP) -o $(OUTFILE).elf $(OBJS)
	$(OBJCOPY) $(OCFLAGS) -O binary $(OUTFILE).elf $(OUTFILE).bin
	$(LPCRC) firmware.bin

clean:
	rm -f $(OBJS) $(LD_TEMP) $(OUTFILE).elf $(OUTFILE).bin $(OUTFILE).hex
