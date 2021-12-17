defmodule Kata do
  def disemvowel(s) do
  vowels = ["a", "e", "i", "o", "u"]
      s
      |> String.graphemes()
      |> Enum.filter(fn word -> String.downcase(word) not in vowels end)
      |> Enum.join()
  end
end
