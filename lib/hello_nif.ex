defmodule HelloNif do
  @on_load :load_nif

  def load_nif do
    :ok = :erlang.load_nif(~c'./multiply', 0)
  end

  def multiply(_a, _b), do: :erlang.nif_error(:nif_not_loaded)
end
