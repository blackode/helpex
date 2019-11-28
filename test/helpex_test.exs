defmodule HelpexTest do
  use ExUnit.Case
  doctest Helpex
  doctest Helpex.Map
  doctest Helpex.Kernel
  doctest Helpex.String

  test "greets the world" do
    assert Helpex.hello() == :world
  end
end
