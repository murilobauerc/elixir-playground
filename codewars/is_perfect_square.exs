defmodule Math do
  def square?(n) when n < 0 do
    false
  end

  def square?(n) do
    # TODO
    root = :math.sqrt(n)
    n == trunc(root) * trunc(root)
  end

end
