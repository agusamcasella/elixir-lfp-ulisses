defmodule RpgEjercicio  do
  defguard is_valid(a) when is_integer(a) and a > 0

  def total_spent(%{strength: s, dexterity: d, intelligence: i}) when is_valid(s) and is_valid(d) and is_valid(i) do
    total = (s*2) + ((d+i)*3)
    IO.puts(total)
  end
end



# defmodule NumberCompareWithIf do
#   def greater(number, other_number) do
#     if number >= other_number do
#       number
#     else
#       other_number
#     end
#   end
# end
