.PHONY:all clean
ifeq ($(DEBUG),"true")
CC=gcc -g
else
CC=gcc
endif
BIN := $(addprefix ../,$(BIN))
LINK_OBJ_DIR =/home/lees/Desktop/lesswork/lcd/mp3/app/link_obj
$(shell mkdir -p $(LINK_OBJ_DIR))
SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)
OBJS := $(addprefix $(LINK_OBJ_DIR)/,$(OBJS))
OBJECT = $(wildcard $(LINK_OBJ_DIR)/*.o)
OBJECT +=$(OBJS)
DEPS = $(SRCS:.c=.d)	
all:$(OBJS) $(DEPS) $(BIN)
ifneq ("$(wildcard $(DEPS))","")
include $(DEPS)
endif
$(BIN):$(OBJECT)
	@echo "$(OBJECT)"
	$(CC) -o $@ $^
$(LINK_OBJ_DIR)/%.o:%.c
	$(CC) -o $@ -c $(filter %.c,$^)
%.d:%.c 
	$(CC) -MM $^ | sed 's,\(.*\).o[ :]*,$(LINK_OBJ_DIR)/\1.o:,g' > $@

clean:
	rm -rf $(BIN) $(OBJS) $(DEPS)
