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

# import modules
import List

[1,2,3] |> last() |> IO.inspect() # using pipe

IO.inspect(last([4,5,6]))


# filtering modules with :only and :except
# import List, only: [last: 1]
# [1,2,3] |> first() |> IO.inspect() # ERROR, only last() function is available


import List, except: [last: 1]
[1,2,3] |> first() |> IO.inspect()


# importing only atoms :functions and :macros
import List, only :functions
import List, only :macros


# using require

defmodule Example do
  require SuperMacros

  SuperMacros.do_stuff
end



# macro `use`
defmodule Hello do
  defmacro __using__(_opts) do
    quote do
      def hello(name), do: "Hi, #{name}"
    end
  end
end


defmodule Example do
  use Hello
end

IO.inspect(Example.hello())
