defmodule HelloNif do
  @on_load :load_nif

  def load_nif do
    path = Application.app_dir(:hello_nif, "priv/multiply.so")
    case :erlang.load_nif(path, 0) do
      :ok -> :ok
      {:error, reason} -> IO.puts("Failed to load NIF: #{reason}")
    end
  end

  def multiply(_a, _b), do: :erlang.nif_error(:nif_not_loaded)
end
