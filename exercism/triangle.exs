defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) when a <= 0 or b <= 0 or c <= 0 do
    {:error, "all side lengths must be positive"}
  end

  def kind(a, b, c) when a == b and b == c do
    case valid_triangle?(a, b, c) do
      true -> {:ok, :equilateral}
      _ -> {:error, "side lengths violate triangle inequality"}
    end
  end

  def kind(a, b, c)
    when a == b and b != c
    when a != b and b == c
    when a == c and b != c
  do
    case valid_triangle?(a, b, c) do
      true -> {:ok, :isosceles}
       _ -> {:error, "side lengths violate triangle inequality"}
    end
  end

  def kind(a, b, c) when a != b and b != c do
    case valid_triangle?(a, b, c) do
      true -> {:ok, :scalene}
      _ -> {:error, "side lengths violate triangle inequality"}
    end
  end

  defp valid_triangle?(a, b, c) do
    if a + b >= c and b + c >= a and a + c >= b, do: true, else: false
  end
end
