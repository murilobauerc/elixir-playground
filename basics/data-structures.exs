# Lists, tuples, maps on Elixir


# Lists
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

IO.inspect head
IO.inspect tail


# Tuples

