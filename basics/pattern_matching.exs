_ = """
technique that allows us to extract
simpler substructures from complicated data structures like lists, tuples, maps, etc.
"""

[{var_1}, _unused_var, var_2] = [{"First variable"}, 25, "Second variable" ]
IO.puts(var_1)
IO.puts(var_2)

[_, [_, {a}]] = ["Random String", [:an_atom, {24}]]
IO.puts(a)


a = 25
b = 25
IO.puts(^a = b)
