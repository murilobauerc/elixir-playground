defmodule BirdCount do
  # Alternative solution would be List.first(list)
  def today([head | tail]) do
    head
  end

  def today([]) do
    nil
  end

  def increment_day_count([head | tail]) do
    [head + 1 | tail]
  end

  def increment_day_count([]) do
    [1]
  end

  def has_day_without_birds?([]) do
     false
  end

  def has_day_without_birds?([head | tail]) do
     head == 0 or has_day_without_birds?(tail)
  end

  def total([]) do
    0
  end

  def total([head | tail]) do
    head + total(tail)
  end

  def busy_days([head | tail]) when head > 4, do: 1 + busy_days(tail)
  def busy_days([head | tail]), do: busy_days(tail)

 def busy_days([]) do
    0
  end

end
