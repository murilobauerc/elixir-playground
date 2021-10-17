# Create a method upper_case? to see whether the string is ALL CAPS. For example:
# upper_case?("HELLO I AM DONALD") == true
# upper_case?("hello I AM DONALD") == false

defmodule StringUtils do
  def upper_case?(str) do
    str == String.upcase(str)
  end
end

