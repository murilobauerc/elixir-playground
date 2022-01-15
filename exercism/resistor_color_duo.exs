defmodule ResistorColorDuo do
  @doc """
  Calculate a resistance value from two colors
  """

  @map %{black: 0, brown: 1, red: 2, orange: 3, yellow: 4, green: 5, blue: 6, violet: 7, grey: 8, white: 9}

  @spec value(colors :: [atom]) :: integer
  def value(colors) do
    colors
    |> Enum.map(&get_color_value(&1))
    |> Enum.take(2)
    |> Enum.join("")
    |> String.to_integer()
  end

  defp get_color_value(color) do
    Map.get(@map, color)
  end
end
