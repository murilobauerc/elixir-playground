# kata: remove the first character and last character

defmodule RemoveChars do
  def remove_chars(s) do
    s
    |> String.slice(1, String.length(s) - 2)
  end
end
