export PERL5LIB=../pegex-pm/lib

COMPILE_COMMAND = perl -MPegex::Compiler -e \
    'print Pegex::Compiler->compile_raw(shift)->to_

all: pegex.pgx.yaml pegex.pgx.json

pegex.pgx.yaml: pegex.pgx Makefile
	$(COMPILE_COMMAND)yaml' $< > $@

pegex.pgx.json: pegex.pgx Makefile
	$(COMPILE_COMMAND)json' $< > $@

clean:
	rm -f pegex.pgx.*
