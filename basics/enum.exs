# Enum: A set of algorithms for enumerating over enumerables.

# all?/2
all = Enum.all?(["veller", "jean", "murilo"], fn(s) -> String.length(s) == 3 end)
IO.puts(all)

# all?/2
more_than_two_digits = Enum.all?([1203, 20, 30213, 393, 32, 21, 2022], fn(number) -> number > 10 end)
IO.puts(more_than_two_digits)

# any?/2
any = Enum.any?(["foo", "bar", "hello"], fn(s) -> String.length(s) > 3 end)
IO.puts(any)


# chunk_every/2
chunk = Enum.chunk_every([1,2,3,4,], 2)
IO.inspect(chunk) # [[1,2], [3,4]]


# chunk_by/2
chunk_by = Enum.chunk_by(["one", "two", "three", "four"], fn(x) -> String.length(x) end)
IO.inspect(chunk_by)

