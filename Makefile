# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -O2
LDFLAGS = -pthread
AR = ar
ARFLAGS = rcs

# Target executable
TARGET = exodus-coordinator

# Default target: Build the main executable
all: $(TARGET)

$(TARGET): exodus-coordinator.c ctz-json.a
	$(CC) $(CFLAGS) $< ctz-json.a -o $@ $(LDFLAGS)


ctz-json.a: ctz-json.o
	$(AR) $(ARFLAGS) $@ $<


ctz-json.o: ctz-json.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean target: Remove generated files
clean:
	rm -f $(TARGET) ctz-json.a ctz-json.o