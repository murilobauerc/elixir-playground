defmodule EscriptsTest do
  use ExUnit.Case
  doctest Escripts

  test "greets the world" do
    assert Escripts.hello() == :world
  end
end
