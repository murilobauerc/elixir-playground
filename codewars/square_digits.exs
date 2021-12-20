defmodule Kata do
    def square_digits(n) do
        n
        |> Integer.to_string()
        |> String.graphemes()
        |> Enum.map(fn x -> Integer.pow(String.to_integer(x), 2) end)
        |> Enum.join()
        |> String.to_integer()
    end

    def better_solution_square_digits(n) do
      n
      |> Integer.digits()
      |> Enum.map(fn x -> Integer.pow(x,2) end)
      |> Enum.join()
      |> String.to_integer()
    end

end

result = Kata.better_solution_square_digits(723_041)
IO.inspect(result === 49490161)
