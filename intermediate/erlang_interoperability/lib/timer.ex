defmodule CustomTimer do
  '''
  Um dos benefícios adicionais em se construir em cima da Erlang VM (BEAM) é a abundância de bibliotecas existentes disponíveis para nós.
  A interoperabilidade nos permite usar essas bibliotecas e a biblioteca padrão Erlang a partir do nosso código Elixir.
  '''
  # A extensa biblioteca padrão Erlang pode ser acessada de qualquer código Elixir em nossa aplicação.
  # Módulos Erlang são representados por átomos em caixa baixa como :os e :timer.
  # Vamos usar :timer.tc para medir o tempo de execução de uma determinada função:

  def tempo(fun,args) do
    {time, result} = :timer.tc(fun,args)
    IO.puts("Time: #{time} us")
    IO.puts("Result: #{result}")
  end
end

range = 1..10_000_000
CustomTimer.tempo(fn x -> x + 1 end)

# stream = Stream.map(range, &(&1)) |> Enum.take(10)
