'''
Write a function findNeedle() that takes an array full of junk but containing one "needle"

After your function finds the needle it should return a message (as a string) that says:

"found the needle at position " plus the index it found the needle, so:
'''
defmodule Finder do
  def find_needle(haystack) do
    index = Enum.find_index(haystack,& &1 == "needle")
    "found the needle at position #{index}"
  end
end
