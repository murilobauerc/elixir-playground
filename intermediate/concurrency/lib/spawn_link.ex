defmodule Example do
  def explode, do: exit(:kaboom)
end

# iex> spawn(Example, :explode, [])
# #PID<0.66.0>

#iex > spawn_link(Example, :explode, [])
# ** (EXIT from #PID<0.57.0>) evaluator process exited with reason: :kaboom
