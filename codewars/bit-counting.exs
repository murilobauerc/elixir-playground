"""
Write a function that takes an integer as input, and returns the number of bits that are equal to one in the binary representation of that number. You can guarantee that input is non-negative.
Example: The binary representation of 1234 is 10011010010, so the function should return 5 in this case
"""

defmodule CountBits do
  def bits(n) do
    binary_list = String.graphemes(Integer.to_string(n,2))
    Enum.count(binary_list, fn c -> c === "1" end)
  end
end


# Alternative solution using Capture operator `&`

defmodule CountBits do
  def bits(n) do
    binary_list = String.graphemes(Integer.to_string(n,2))
    Enum.count(binary_list, &(&1 === "1")
  end
end



