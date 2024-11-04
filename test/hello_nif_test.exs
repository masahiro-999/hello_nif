defmodule HelloNifTest do
  use ExUnit.Case
  doctest HelloNif

  test "greets the world" do
    assert HelloNif.hello() == :world
  end
end
