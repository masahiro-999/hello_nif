#include "erl_nif.h"

static ERL_NIF_TERM multiply(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) {
    int a, b;
    if (!enif_get_int(env, argv[0], &a) || !enif_get_int(env, argv[1], &b)) {
        return enif_make_badarg(env);
    }
    int result = a * b;
    return enif_make_int(env, result);
}

static ErlNifFunc nif_funcs[] = {
    {"multiply", 2, multiply}
};

ERL_NIF_INIT(Elixir.HelloNif, nif_funcs, NULL, NULL, NULL, NULL)