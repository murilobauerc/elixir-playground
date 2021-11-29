defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      level === 0 and !legacy? -> :trace
      level === 1 -> :debug
      level === 2 -> :info
      level === 3 -> :warning
      level === 4 -> :error
      level === 5 and !legacy? -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    cond do
      level === 5 and !legacy? -> :ops
      level === 6 and !legacy? -> :dev2
      level === 0 and !legacy? -> :nil
      level === 2 and (!legacy? or legacy?) -> :nil
      level === 3 and (!legacy? or legacy?) -> :nil
      level === -1 or level === 0 or level === 5 or level === 6 -> :dev1
      (level === 0 or level === 1) and (legacy? or !legacy?) -> :nil
      level === 4 -> :ops
      true -> :unknown
    end
  end
end
