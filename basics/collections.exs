# Lists, tuples, keyword lists, and maps.
# List syntax []
# Tuples syntax {}
# Maps syntax %{}


# Lists []
list = [3.14, :pie, "Apple"]
IO.inspect list


# prepending (insert on the beginning of the list) FAST
IO.inspect ["pi" | list]


# appending (insert at the end of the list) SLOW
IO.inspect list ++ ["Cherry"]


# concatenation
IO.inspect [1,2] ++ [3,4,1] # [1,2,3,4,1]


# head and tail
IO.inspect("Head of the list is: #{hd list}") # 3.14

IO.inspect(tl list) # :pie, "Apple"

# better way to have head and tail
[head | tail] = [3.14, :pie, "Apple"]

IO.inspect "This is the head #{head}"
IO.inspect tail


# Tuples {}

tuple = {"banana", "apple", "strawberry"}
IO.inspect(tuple)

# Keyword lists - associative collections
# Keys are atoms and ordered. "foo", "hello".
# Keys are not strict equal.

keyword_list = [foo: "bar", hello: "world"]
IO.inspect(keyword_list)


# Maps %{}

map = %{:foo => "bar", "hello" => :world}
IO.inspect(map)

# access first value on the map
IO.inspect(map[:foo])

IO.inspect(map["hello"])

# Maps with only atom keys 

only_atom_keys_map = %{fruit: "banana", second_fruit: "apple"}
generic_map = %{:fruit => "banana", :second_fruit => "apple"}

IO.inspect(only_atom_keys_map == generic_map) # true

IO.inspect(only_atom_keys_map.fruit)

# Add a new key into map: `Map.put/3`

new_map = %{hello: "world"}

IO.inspect(Map.put(new_map, :foo, "baz"))
