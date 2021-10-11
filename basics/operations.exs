_ = """
Elixir supports basic operators `+`, `-`, `*`, `/`
"""

# arithmetic operations

IO.puts 2 + 2

IO.puts 16 - 4

IO.puts 5 * 2

# returns 5.0 float
IO.puts 10 / 2

# returns an integer 5 with function div(10,2) 
IO.puts div(10,2)


# module with function rem(x,y)
IO.puts rem(10,3)


_ = """
Elixir supports boolean operators `||`, `&&`, `!`
"""

# returns -20
IO.puts -20 || true

# returns 42
IO.puts false || 42

# returns true
IO.puts 42 && true

# returns nil
IO.puts 42 && nil

# returns false
IO.puts !42

# returns true
IO.puts !false

_ = """
Elixir supports conditional operators "and", "or", "not"
FIRST ARGUMENT HAS TO BE BOOLEAN
""" 
IO.puts true and 42

IO.puts false or true

# ERROR
# IO.puts 42 and true


_ = """
Elixir supports comparison operators  `==`, `!=`, `===`, `!==`, `<=`, `>=`, `<` e `>`.
Any data type is comparable on Elixir
""" 
IO.puts 5 > 2

IO.puts 1 < 2

IO.puts 10 !== 2

IO.puts 6 <= 3 

IO.puts 2 == 2.0  # true

IO.puts 2 === 2.0 # false

IO.puts :hello > 999 # true

IO.puts {:hello, :world} > [1,2,3] # false


# String Interpolation - #{}
name = "Murilo"
IO.puts "Hello #{name}. Your age is #{18+5}"

# String concatenation - <>
nameConcat = "Murilo"
IO.puts "Hello " <> nameConcat