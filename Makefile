GRAMMAR = *.pgx
export PERL5LIB=../pegex-pm/lib:../pegex-cmd-pm/lib
COMPILE_COMMAND = pegex compile --boot --to=
ALL = $(GRAMMAR).yaml $(GRAMMAR).json

all: $(ALL)

$(ALL): $(GRAMMAR) Makefile
	$(COMPILE_COMMAND)$(@:$<.%=%) $< > $@
