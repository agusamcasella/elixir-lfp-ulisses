#version 1 con funciones privadas para cada caso del >= en check hay otra con guard clauses queda mas simple
defmodule NumberCompare do
  def greater(number, other_number) do
      check(number >= other_number, number, other_number)
  end
  defp check(true, number, _), do: number
  defp check(false, _, other_number), do: other_number
end
