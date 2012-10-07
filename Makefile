GRAMMAR = *.pgx
export PERL5LIB=../pegex-pm/lib:../pegex-cmd-pm/lib

# STYLE should usually be NORMAL, but we set it to BOOT for Pegex grammar
# itself.
# To be sure of changes, run both of these commands:
#    STYLE=BOOT make
#    STYLE=NORMAL make
# And check that they do the exact same thing!

# STYLE ?= NORMAL
STYLE ?= BOOT

NORMAL_COMMAND = pegex compile --to=
BOOT_COMMAND = pegex compile --boot --to=
COMMAND = ${${STYLE}_COMMAND}
ALL = $(GRAMMAR).yaml $(GRAMMAR).json

all: $(ALL)

$(ALL): $(GRAMMAR) Makefile
	$(COMMAND)$(@:$<.%=%) $< > $@
	perl -pi -e "s/\r//g" $@
