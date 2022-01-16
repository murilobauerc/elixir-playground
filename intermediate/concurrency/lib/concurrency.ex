defmodule Concurrency do
  def listen do
    receive do
      {:ok, :multiply} -> IO.puts("Multiplying 5 * 5... = #{5*5}")
      {:ok, :sum} -> IO.puts("Sum of 1 + 2... = #{1+2}")
      {:ok, :division} -> IO.puts("Division of 10 / 2... = #{10/2}")
      {:ok, :sub} -> IO.puts("Subtraction of 20 - 2... = #{20-2}")
    end
    listen()
  end

end

# function `listen` above is listening and checking
# if there is any message matching the clauses in the current process mailbox

# how to send a message, you should ask?
'''
$ iex -S mix
iex> pid = spawn(Concurrency, :listen, [])
iex> send (pid, {:ok, multiply})
Multiplying 5 * 5... = 25
'''
