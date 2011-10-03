GRAMMAR = *.pgx
export PERL5LIB=../pegex-pm/lib
COMPILE_COMMAND = pegex compile --to=
ALL = $(GRAMMAR).yaml $(GRAMMAR).json

all: $(ALL)

$(ALL): $(GRAMMAR) Makefile
	$(COMPILE_COMMAND)$(@:$<.%=%) $< > $@
