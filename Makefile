export PERL5LIB=../pegex-pm/lib

COMPILE_COMMAND = perl -MPegex::Compiler::Bootstrap -e \
    'print Pegex::Compiler::Bootstrap->compile_file(shift)->to_

all: pegex.pgx.yaml pegex.pgx.json

pegex.pgx.yaml: pegex.pgx Makefile
	$(COMPILE_COMMAND)yaml' $< > $@

pegex.pgx.json: pegex.pgx Makefile
	$(COMPILE_COMMAND)json' $< > $@

clean:
	rm -f pegex.pgx.*
