PREFIX = $(MIX_APP_PATH)/priv
BUILD  = $(MIX_APP_PATH)/obj

NIF = $(PREFIX)/multiply.so

SRC = c_src/multiply.c

ERLANG_INCLUDE_DIR = $(shell erl -eval 'io:format("~s", [code:lib_dir(erl_interface, include)])' -s init stop -noshell)
ERTS_INCLUDE_DIR = $(shell erl -eval 'io:format("~s", [code:root_dir() ++ "/erts-" ++ erlang:system_info(version) ++ "/include"])' -s init stop -noshell)

all: compile

compile:
	mkdir -p $(PREFIX)
	$(CC) -o $(NIF) -shared -fPIC -I$(ERTS_INCLUDE_DIR) $(SRC)

clean:
	rm -f $(NIF)