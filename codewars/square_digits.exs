defmodule Kata do
    def square_digits(n) do
        n
        |> Integer.to_string()
        |> String.graphemes()
        |> Enum.map(fn x -> Integer.pow(String.to_integer(x), 2) end)
        |> Enum.join()
        |> String.to_integer()
    end
end
