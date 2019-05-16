# Declaration of variables
CC = gcc 
CC_FLAGS=-lpanel -lncurses -g -Wall -std=c89
 
# File names
EXEC = out/hag
OUTDIR  = out/
OBJDIR  = $(OUTDIR)/objects/
SRCDIR  = src/
SOURCES = $(wildcard $(SRCDIR)/*.c)
OBJECTS = $(addprefix $(OBJDIR), $(notdir $(SOURCES:.c=.o)))
 
# Main target
$(EXEC): $(OBJECTS)
	$(CC) $^ -o $@ $(CC_FLAGS)
 
# To obtain object files
$(OBJDIR)%.o: $(SRCDIR)%.c $(OBJDIR)
	$(CC) -c $< -o $@ $(CC_FLAGS)

# Directories
$(OUTDIR):
	mkdir $(OUTDIR)

$(OBJDIR): $(OUTDIR)
	mkdir $(OBJDIR)
 
# To remove generated files
clean:
	rm -f $(EXEC) $(OBJECTS)
