_ = """
Elixir supports integers, binary, octal, hex, float, boolean, strings and atoms.
"""

# prints the integer 255
IO.puts 255

# binary - prefix 0b
IO.puts 0b0110

# octal - prefix 0o
IO.puts 0o52

# hex - prefix 0x
IO.puts 0x1F

# float - requires at least one decimal
IO.puts 3.14
IO.puts 1.0e-10


# boolean - true or false
IO.puts true
IO.puts false

# atoms - Atoms are constants whose name is their value.
IO.puts :foo
IO.puts :bar


# strings
IO.puts "Hello World"
IO.puts "foo\nbar"
