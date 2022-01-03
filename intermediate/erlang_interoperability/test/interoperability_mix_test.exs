defmodule InteroperabilityMixTest do
  use ExUnit.Case
  doctest InteroperabilityMix

  test "greets the world" do
    assert InteroperabilityMix.hello() == :world
  end
end
