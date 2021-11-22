use Bitwise

defmodule Secrets do
  def secret_add(secret) do
     fn item -> secret + item end
  end

  def secret_subtract(secret) do
    fn item -> item - secret end
  end

  def secret_multiply(secret) do
    fn item -> item * secret end
  end

  def secret_divide(secret) do
    fn item -> div(item, secret) end
  end

  def secret_and(secret) do
    fn item -> item &&& secret end
  end

  def secret_xor(secret) do
    fn item -> bxor(item,secret) end
  end

  def secret_combine(secret_function1, secret_function2) do
     fn item ->
        item
        |> secret_function1.()
        |> secret_function2.()
    end
  end
end

add = Secrets.secret_add(6)
IO.puts(add.(9) === 15)

subtraction = Secrets.secret_subtract(6)
IO.puts(subtraction.(3) === -3)

divide = Secrets.secret_divide(3)
IO.puts(divide.(6) === 2)

multiply = Secrets.secret_multiply(5)
IO.puts(multiply.(5) === 25)
