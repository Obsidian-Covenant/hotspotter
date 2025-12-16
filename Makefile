# Top-level Makefile (build sources in ./src)

CC       ?= cc
CFLAGS   ?= -g3 -ggdb -pipe -Wall
LDLIBS   ?= -lpcap

SRC_DIR  := src

PROG     := hotspotter
SRCS     := $(SRC_DIR)/hotspotter.c $(SRC_DIR)/utils.c
OBJS     := $(SRCS:.c=.o)
DEPS     := $(OBJS:.o=.d)

# Install locations
PREFIX   ?= /usr/local
BINDIR   ?= $(PREFIX)/bin
DESTDIR  ?=

.PHONY: all clean install uninstall

all: $(PROG)

$(PROG): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS) $(LDLIBS)

# Compile .c -> .o and generate header deps (.d)
$(SRC_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -MMD -MP -c $< -o $@

# Pull in auto-generated dependency files if they exist
-include $(DEPS)

install: $(PROG)
	install -d "$(DESTDIR)$(BINDIR)"
	install -m 0755 "$(PROG)" "$(DESTDIR)$(BINDIR)/$(PROG)"

uninstall:
	$(RM) "$(DESTDIR)$(BINDIR)/$(PROG)"

clean:
	$(RM) $(PROG) $(OBJS) $(DEPS) *~
