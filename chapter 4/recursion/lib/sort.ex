defmodule Sort do
  #caso base lista vacia
  def ascending([]), do: []
  #caso base lista 1 elemento
  def ascending([a]), do: [a]
  #caso general lista con al menos 2 elementos
  #se divide la lista a la mitad, y luego se le aplica merge
  def ascending(list) do
  half_size = div(Enum.count(list), 2)
  {list_a, list_b} = Enum.split(list, half_size)

  merge(
    ascending(list_a),
    ascending(list_b)
  )

  end
  #merge funcion recursiva

  #caso primera mitad vacia, devuelvo la segunda mitad
  defp merge([], list_b), do: list_b
  #caso segunda mitad vacia, devuelvo la primera mitad
  defp merge(list_a, []), do: list_a

  #si ambos tienen elementos, reviso cabezal de primera mitad vs cabezal de segunda

  #caso si cabezal de primera es menor que cabezal de segunda, me quedo con el cabezal de la primera
  #y vuelvo a tirar merge entre cola de la primera y la segunda lista
  defp merge([head_a | tail_a], list_b = [head_b | _]) when head_a <= head_b do
       [head_a | merge(tail_a, list_b)]
  end

  #caso si cabezal de segunda es menor que cabezal de primera, me quedo con el cabezal de la segunda
  #y vuelvo a tirar merge entre la primera y la cola de la segunda

  defp merge(list_a = [head_a | _], [head_b | tail_b]) when head_a > head_b do
       [head_b | merge(list_a, tail_b)]
  end

end
