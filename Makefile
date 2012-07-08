GRAMMAR = *.pgx
export PERL5LIB=../pegex-pm/lib:../pegex-cmd-pm/lib
STYLE ?= NORMAL
NORMAL_COMMAND = pegex compile --to=
BOOT_COMMAND = pegex compile --boot --to=
COMMAND = ${${STYLE}_COMMAND}
ALL = $(GRAMMAR).yaml $(GRAMMAR).json

all: $(ALL)

$(ALL): $(GRAMMAR) Makefile
	$(COMMAND)$(@:$<.%=%) $< > $@
