# O operador pipe |> passa o resultado de uma expressão como o primeiro parâmetro de outra expressão.

# Exemplo 1
"Hello World" |> IO.puts()



# Tokenize String

"Elixir rocks"
    |> String.split()
    |> IO.inspect()

# convert letters to upcase

"Elixir rocks"
    |> String.upcase()
    |> String.split()
    |> IO.inspect()


"elixir"
    |> String.ends_with?("ixir")
    |> IO.puts()
