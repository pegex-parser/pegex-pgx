export PERL5LIB=$(HOME)/src/pegex-pm/lib

TO_YAML = perl -MPegex::Compiler::Bootstrap -e 'print Pegex::Compiler::Bootstrap->grammar_file_to_yaml(shift)'
TO_JSON = perl -MYAML::XS -MJSON::XS -e 'print encode_json YAML::XS::LoadFile(shift)'

all: pegex.pgx.yaml pegex.pgx.json

pegex.pgx.yaml: pegex.pgx Makefile
	$(TO_YAML) $< > $@

pegex.pgx.json: pegex.pgx.yaml
	 $(TO_JSON) $< > $@

clean:
	rm -f pegex.pgx.*
