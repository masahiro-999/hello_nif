defmodule HelloNif.MixProject do
  use Mix.Project

  def project do
    [
      app: :hello_nif,
      version: "0.1.0",
      elixir: "~> 1.17",
      compilers: [:elixir_make] ++ Mix.compilers(), # ElixirMake を追加
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:elixir_make, "~> 0.6"}
    ]
  end
end
