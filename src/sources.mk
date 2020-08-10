#******************************************************************************
# Copyright (C) 2017 by Alex Fosdick - University of Colorado
#
# Redistribution, modification or use of this software in source or binary
# forms is permitted as long as the files maintain this copyright. Users are 
# permitted to modify this and use it to learn about the field of embedded
# software. Alex Fosdick and the University of Colorado are not liable for any
# misuse of this material. 
#
# @author Ramgopal J
# @date   10/08/2020
#*****************************************************************************

ifeq ($(PLATFORM), MSP432 )
	SOURCES = ./main.c \
                  ./memory.c\
                  ./interrupts_msp432p401r_gcc.c\ 
                  ./startup_msp432p401r_gcc.c\
                  ./system_msp432p401r.c 

 INCLUDES = -I./common \
            -I./cmsis_gcc.h \
            -I./core_cm4.h \
            -I./core_cmFunc.h \
            -I./core_cmInstr.h \
            -I./core_cmSimd.h \
            -I./memory.h \
            -I./platform.h \
            -I./msp432p401r.h \
            -I./msp_compatibility.h \
            -I./cmsis_gcc.h \
            -I./system_msp432p401r.h 
endif

ifeq ($(PLATFORM),HOST)
 SOURCES = ./main.c \
           ./memory.c
                  
 INCLUDES = -I./memory.h \
            -I./platform.h 
         
endif                   
