#******************************************************************************
# Copyright (C) 2017 by Alex Fosdick - University of Colorado
#
# Redistribution, modification or use of this software in source or binary
# forms is permitted as long as the files maintain this copyright. Users are 
# permitted to modify this and use it to learn about the field of embedded
# software. Alex Fosdick and the University of Colorado are not liable for any
# misuse of this material. 
#
#*****************************************************************************

#------------------------------------------------------------------------------
# <Put a Description Here>
#
# Use: make [TARGET] [PLATFORM-OVERRIDES]
#
# Build Targets:
#      <Put a description of the supported targets here>
#
# Platform Overrides:
#      <Put a description of the supported Overrides here
#
#------------------------------------------------------------------------------
include sources.mk

# Platform Overrides
PLATFORM = HOST

# Architectures Specific Flags
LINKER_FILE = ./ msp432p401r.lds 
CPU = cortex-m4
ARCH = armv7e-m
SPECS = nosys.specs 
TARGET = C1M2
OUTPUT_EXT = out
SHAREDCFLAGS = -Wall -Werror -std=c99 -g 
SHAREDLDFLAGS = -Wl,-map= $(TARGET).map -O0

ifeq ($(PLATFORM),MSP432)
    CC = arm-none-eabi-gcc
    LD = arm-none-eabi-ld
    SIZE = arm-none-eabi-size
    LDFLAGS = -T $(LINKER_FILE)
    CFLAGS = -$(SHAREDLDFLAGS) 
    CPPFLAGs = -march=$(ARCH) -mthumb - mfloat-abi=hard -mfpu=fvp4-sp-d16 --specs=$(SPECS) \
               -mcpu=$(CPU)
endif

ifeq ($(PLATFORM),HOST)
    CC = gcc
    LD = ld
    SIZE = size
    LDFLAGS = $(SHAREDLDFLAGS) 
    CFLAGS = $(SHAREDCFLAGS)
    CPPFLAGs = 
endif

OBJS := $(SOURCES:.c = .o)
PRE_FILES := $(SOURCES:.c=.i)
ASM_FILES := $(SOURCES:.c=.asm)
MAP_FILES := $(SOURCES:.c=.map)
DEP_FILES := $(SOURCES:.c=.d)

%.i : %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) $(INCLUDES) -E $< -o $@

%.asm : %.c 
	$(CC) $(CFLAGS) $(CPPFLAGS) $(INCLUDES) -S $< -o $@

%.d : %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) $(INCLUDES) $(LDFLAGS) -MM $< > $@

%.o : %.c
	$(CC) $(CFLAGS) $(CPPFLAG) $(INCLUDES) -c $< -o $@


.PHONY: compile-all
compile all: $(OBJS)


.PHONY: build
build : $(TARGET).$(OUTPUT_EXT)

$(OUTPUT_NAME).$(OUTPUT_EXT): $(OBJS) $(DEP_FILES)
	$(CC) $(OBJS) $(CFLAGS) $(LDFLAGS) -o $@
	$(SIZE) $@

$(OUTPUT_NAME).asm: $(TARGET).$(OUTPUT_TXT) 
	$(OBJDUMP) --disassemble $(TARGET).$(OUTPUT_EXT) > $(TARGET).asm 	

.PHONY : clean
clean : 
	rm -rf $(TARGET).$(OUTPUT_EXIT) $(OUTPUT_NAME).asm $(TARGET),map $(OBJS) $(PRE_FILES) $(ASM_FILES) $(MAP_FILES) $(DEP_FILES)






