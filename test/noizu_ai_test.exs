defmodule NoizuAITest do
  use ExUnit.Case
  doctest NoizuAI

  test "greets the world" do
    assert NoizuAI.hello() == :world
  end
end
