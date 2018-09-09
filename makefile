.PHONY:all clean
ifeq ($(DEBUG),"true")
CC=gcc -g
else
CC=gcc
endif
BIN=mp3
SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)
DEPS = $(SRCS:.c=.d)	
all:$(BIN) $(DEPS)
ifneq ("$(wildcard $(DEPS))","")
include $(DEPS)
endif
$(BIN):$(OBJS)
	$(CC) -o $@ $^
#usb.o:usb.c usb.h
%.o:%.c
	$(CC) -o $@ -c $(filter %.c,$^)
%.d:%.c 
	$(CC) -MM $^ > $@

clean:
	rm -rf $(BIN) $(OBJS) $(DEPS)
