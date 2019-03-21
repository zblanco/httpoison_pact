defmodule HttpoisonPactTest do
  use ExUnit.Case
  doctest HttpoisonPact

  test "greets the world" do
    assert HttpoisonPact.hello() == :world
  end
end
