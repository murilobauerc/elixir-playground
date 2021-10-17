# if/2

if String.valid?("Hello") do
    IO.puts "Valid String!"
else
    IO.puts "Invalid String."
end

if "a string value" do
    IO.puts "Truthy"
end


# unless/2
unless is_integer("Hello") do
    IO.puts "Not an Int"
end



# case/2
case {:ok, "Hello World"} do
    {:ok, result} -> IO.puts result
    {:error} -> "Uh oh!"
    _ -> "Catch all"
end


case :even do
    :odd -> "Odd"
    _ -> IO.puts "Not Odd"
end


# Procurar padrões do `case/2` em variáveis que já existem: operador pin `^/1`

x = 1
case 10 do
    ^x -> IO.puts "Variable #{x} Won't match"
    _ -> IO.puts "Variable #{x} Will match"
end


case {1,2,3} do
    {4,5,6} ->
        IO.puts "This clause won't match!"
    {1,x,3} ->
        IO.puts "This clause will match and bind x to 2 in this clause"
    _ ->
        IO.puts "This clause would match any value"
end

# case/2 para guard clauses
case {1,2,3} do
    {1,x,3} when x > 0 -> IO.puts "Guard clause will match"
    _ -> IO.puts "Won't match"
end


# cond/1  (semelhante ao else if ou elsif)

cond do
    2 + 2 == 5 -> IO.puts "This will not be true"
    2 * 2 == 3 -> IO.puts "Nor this"
    1 + 1 == 2 -> IO.puts "But this will"
end

cond do
    7 + 1 == 0 -> IO.puts "Incorrect"
    true -> IO.puts "Catch all"
end
