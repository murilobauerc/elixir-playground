# elixir's convention is to handle errors with a tuple {:ok, result} and {:error, reason}
# here we are going to focus on exceptions


# raise "Oh No!"

# if we want to specify the type and the message, use raise/2
# raise ArgumentError, message: "the argument value is invalid"


# try/rescue
'''
try do
  raise "Oh no!"
rescue
  e in RuntimeError -> IO.puts("An error occured: " <> e.message)
end
'''

'''
try do
  opts
  |> Keyword.fetch!(:source_file)
  |> File.read!()
rescue
  e in KeyError -> IO.puts("missing :source_file option")
  e in File.Error -> IO.puts("unable to read source file")
end
'''

# mais usados com files ou conexoes que devem ser fechadas
{:ok, file} = File.open("example.json")

'''
try do
  # Do hazardous work
after
  File.close(file)
end
'''

# Criar um erro custom
defmodule ExampleError do
  defexception message: "an example error has occurred"
end

try do
  raise ExampleError
rescue
  e in ExampleError -> e
end


# throw and catch
try do
  for x <- 0..10 do
    if x == 5, do: throw(x)
    IO.puts(x)
  end
catch
  x -> "Caught: #{x}"
end

# mecanismo de erro final é o exit (sempre que processos morrem)
# exit/1

spawn_link fn -> exit("oh no") end

try do
  exit "oh no!"
catch
  :exit, _ -> "exit blocked"
end
