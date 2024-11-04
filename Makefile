NIF_NAME = multiply
ERLANG_INCLUDE_DIR = $(shell erl -eval 'io:format("~s", [code:lib_dir(erl_interface, include)])' -s init stop -noshell)
ERTS_INCLUDE_DIR = $(shell erl -eval 'io:format("~s", [code:root_dir() ++ "/erts-" ++ erlang:system_info(version) ++ "/include"])' -s init stop -noshell)

all: compile

compile:
	gcc -o $(NIF_NAME).so -shared -fPIC -I$(ERTS_INCLUDE_DIR) $(NIF_NAME).c

clean:
	rm -f $(NIF_NAME).so