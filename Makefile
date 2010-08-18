export PERL5LIB=$(HOME)/src/pegex-pm/lib

COMPILE_COMMAND = perl -MPegex::Compiler::Bootstrap -e 'print Pegex::Compiler::Bootstrap->new->parse_file(shift)->to_

all: pegex.pgx.yaml pegex.pgx.json

pegex.pgx.yaml: pegex.pgx Makefile
	$(COMPILE_COMMAND)yaml' $< > $@

pegex.pgx.json: pegex.pgx Makefile
	$(COMPILE_COMMAND)json' $< > $@

clean:
	rm -f pegex.pgx.*
