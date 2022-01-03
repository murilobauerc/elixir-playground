_docs =
"""
Create a function that takes a number as an argument and returns the highest digit in that number.
"""

defmodule HighestDigit do
  def highest(n) do
      n
      |> Integer.digits()
      |> Enum.max()
  end
end


IO.puts(HighestDigit.highest(379) == 9)
IO.puts(HighestDigit.highest(2) == 2)
IO.puts(HighestDigit.highest(377401) == 7)
