defmodule Sort do
  #caso base lista vacia
  def descending([]), do: []
  #caso base lista 1 elemento
  def descending([a]), do: [a]
  #caso general lista con al menos 2 elementos
  #se divide la lista a la mitad, y luego se le aplica merge
  def descending(list) do
  half_size = div(Enum.count(list), 2)
  {list_a, list_b} = Enum.split(list, half_size)

  merge(
    descending(list_a),
    descending(list_b)
  )
#####hasta aca es igual a ascending, simplemente te dan una lista, te fijas si es alguna de
#las bases, si es vacia devuelves vacio, si es 1 devuelves lista con ese, y sino, divides en
#dos y aplicas merge, y asi.
  end


  #lo unico que cambia entre ascending y descending es el merge, con que elemento quedas
  #en el caso gral cuando ambas lsitas no son vacias
  #merge funcion recursiva

  #caso primera mitad vacia, devuelvo la segunda mitad
  defp merge([], list_b), do: list_b
  #caso segunda mitad vacia, devuelvo la primera mitad
  defp merge(list_a, []), do: list_a

  #si ambos tienen elementos, reviso cabezal de primera mitad vs cabezal de segunda
 #caso merge para decendiente, cambio signos en la guarda cuando ambas listas no son
 #vacias, simplemente me quedo con el cabezal que sea mayor
  defp merge([head_a | tail_a], list_b = [head_b | _]) when head_a > head_b do
       [head_a | merge(tail_a, list_b)]
  end


  defp merge(list_a = [head_a | _], [head_b | tail_b]) when head_a <= head_b do
       [head_b | merge(list_a, tail_b)]
  end

end
