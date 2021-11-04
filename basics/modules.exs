defmodule Example do
  def greeting(name) do
    "Hello #{name}."
  end
end

"Murilo" |> Example.greeting() |> IO.puts()

IO.puts(Example.greeting("Murilo"))


# É possivel aninhar módulos

defmodule Example.Greetings do
   def morning(name) do
     "Good morning #{name}."
   end

   def evening(name) do
     "Good evening #{name}."
   end
end


"Murilo" |> Example.Greetings.morning() |> IO.puts()

IO.puts(Example.Greetings.morning("Murilo"))



# Módulos usados como constantes
defmodule Example do
  @greeting "Hello"

  def greeting(name) do
   ~s(#{@greeting} {#name}.)
  end
end

# Structs
defmodule Example.User do
  defstruct name: "Sean", roles: []
end
