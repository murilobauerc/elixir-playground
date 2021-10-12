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
chunk_by = Enum.chunk_by(["alo", "one", "two", "three", "four"], fn(x) -> String.length(x) end)
IO.inspect(chunk_by)


# map_every/3
every = Enum.map_every([1000, 2, 3, 50, 1], 3, fn x -> x + 1000 end)
IO.inspect(every)


# each/2
Enum.each(["veller", "jean", "murilo"], fn s -> IO.puts s end)


# map/2
map_result = Enum.map([1,2,3,4,5], fn n -> n - 1 end)
IO.inspect(map_result)

# min/1
IO.inspect(Enum.min([5,3,-1,2,0]))

# max/1
IO.inspect(Enum.max([1,200,391,22,894]))

# filter/2
even_numbers = Enum.filter([0,2,4,5,7,9], fn n -> rem(n,2) == 0 end)
IO.inspect(even_numbers)

# reduce/2
sum_array = Enum.reduce([1,2,3,4], fn num, acc -> num + acc end)
IO.inspect(sum_array)

# sort/1
sorted = Enum.sort([10,23,2, 2,3,4])
IO.inspect(sorted)

sorted_map = Enum.sort([%{:count => 10},%{:count => 4}, %{:count => 1}])
IO.inspect(sorted_map)

# sort/2

Enum.sort([2,3,0,45,1], :desc)
Enum.sort([2,94,1,5,99,2], :asc)

# uniq/1 to remove duplicates
uniq = Enum.uniq([1,1,1,1,303,2,49])
IO.inspect(uniq)

# standard syntax for map/2
standard_map = Enum.map([1,2,3], fn x -> x + 3 end)
IO.inspect(standard_map)


# capture operator (&)
capture = Enum.map([1,2,3], &(&1 + 3))
IO.inspect(capture)

# refactoring capture operator above to looks better
add_3 = &(&1 + 3)
Enum.map([1,2,3,4], add_3)

# capture operator with a named function
defmodule Adding do
    def plus_three(number), do: number + 3
end

Enum.map([1,2,3], fn number -> Adding.plus_three(number) end)