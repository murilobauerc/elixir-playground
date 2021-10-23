
_docs = """
Write a function that takes an integer as input, and returns the number of bits that are equal to one in the binary representation of that number. You can guarantee that input is non-negative.
Example: The binary representation of 1234 is 10011010010, so the function should return 5 in this case
"""

defmodule CountBitsSolution1 do
  def bits(n) do
    binary_list = String.graphemes(Integer.to_string(n,2))
    Enum.count(binary_list, fn c -> c === "1" end)
  end
end


# Alternative solution using Capture operator `&`

defmodule CountBitsSolution2 do
  def bits(n) do
    binary_list = String.graphemes(Integer.to_string(n,2))
    Enum.count(binary_list, &(&1 === "1"))
  end
end

#2 Alternative solution with pipe operator (better code)

_docs = """
This operator introduces the expression on the left-hand side as the first argument to the function call on the right-hand side.
Examples
iex> [1, [2], 3] |> List.flatten()
[1, 2, 3]
"""

defmodule CountBitsSolution3 do
  def bits(n) do
    n
    |> Integer.to_string(2)
    |> String.graphemes()
    |> Enum.count(& &1 === "1")
  end
end

#3 Another alternative solution with digits()

defmodule CountBitsSolution4 do
  def bits(n) do
    n
    |> Integer.digits(2)
    |> Enum.count(& &1 === 1)
  end
end

IO.inspect(CountBitsSolution4.bits(1234) === 5)
