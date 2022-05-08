'''
Every day you rent the car costs $40.
If you rent the car for 7 or more days, you get $50 off your total.
Alternatively, if you rent the car for 3 or more days, you get $20 off your total.
'''

defmodule Rent do
  @cost_per_day 40
  def rental_car_cost(d) when d < 3 do
    @cost_per_day * d
  end

  def rental_car_cost(d) when d >= 3 and d < 7 do
    @cost_per_day * d - 20
  end

  def rental_car_cost(d) when d >= 7 do
    @cost_per_day * d - 50
  end
end
