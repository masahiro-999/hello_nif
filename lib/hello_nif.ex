defmodule HelloNif do
  @on_load :load_nif

  def load_nif() do
    :erlang.load_nif(:code.priv_dir(:hello_nif) ++ ~c"/multiply", 0)
  end

  def multiply(_a, _b), do: :erlang.nif_error(:nif_not_loaded)
end
