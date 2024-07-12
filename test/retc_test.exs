defmodule RetcTest do
  use ExUnit.Case
  doctest Retc

  test "greets the world" do
    assert Retc.hello() == :world
  end
end
