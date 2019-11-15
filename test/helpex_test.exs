defmodule HelpexTest do
  use ExUnit.Case
  doctest Helpex

  test "greets the world" do
    assert Helpex.hello() == :world
  end
end
