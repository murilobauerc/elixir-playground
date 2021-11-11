# Sigil é um simbolo especial que irá começar com um til ~ seguido por um caractere.

~c/2 + 7 = #{2 + 7}/ |> IO.puts()  # COM escape e interpolação


~C/2 + 7 = #{2+7}/ |> IO.puts() # SEM escape e interpolação. Irá imprimir literalmente 2 + 7, e não a soma.


# Expressão regular com ~r e ~R
re = ~r/elixir/i

"Elixir" =~ re

"elixir" =~ re

# API Regex

string = "100_000_000"
Regex.split(~r/_/, string) |> IO.inspect()


# ~s e ~S para String
~s/the cat in the hat on the mat/ |> IO.inspect()


# SEM interpolação. Irá imprimir literalmente #{String.downcase("SCHOOL")}
~S/welcome to elixir #{String.downcase("SCHOOL")/ |> IO.inspect()


# ~w e ~W para lista de palavras
~w/i love elixir school/ |> IO.inspect()


# NaiveDateTime > útil para criar struct que representa `DateTime` sem timezone.
NaiveDateTime.from_iso8601("2015-01-23 23:50:07") == {:ok, ~N[2015-01-23 23:50:07]} |> IO.inspect()


# Custom sigil
defmodule MySigils do
  # sigil_u indica que usaremos `u` como símbolo especial
  def sigil_u(string, []), do: String.upcase(string)
end

~u/elixir school/ |> IO.inspect()
