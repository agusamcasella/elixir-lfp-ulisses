# Write the tail-recursive versions of Sum.up_to/1 and Math.sum/1.
# Extra challenge: write the tail-recursive version of Sort.merge/2.
# defmodule Sum do
#   def up_to(0), do: 0
#   def up_to(n), do: n + up_to(n - 1)
#   end

defmodule Sum do
  def up_to(n), do: sum_up_to(n, 0)
  defp sum_up_to(0, sum), do: sum
  defp sum_up_to(n, sum), do: sum_up_to(n - 1, n + sum)
end

# para que la func sea tailed recursive, la ultima llamada no tiene qeu tener operador de ningun tipo
# debe de ser una llamada a recursion nueva, sino el compilador no podria hacer la optimizacion
# si tuviera un operador, el compilador se iria a resolver la llamada para luego venir con el resultado
# a resolver el operador....en este caso en la linea 11,, si te fijas, la llamada a recursion
# es una nueva llamada completamente, sin operador alguno.

# defmodule Math do
#   def sum([]), do: 0
#   def sum([head | tail]), do: head + sum(tail)
#   end

defmodule Math do
  def sum(list), do: sum_l(list, 0)

  defp sum_l([], n), do: n

  # cuando se vuelve a llamar sum_l,,, la lista a mandar va sin brackets, pq no le tienes que mandar una
  # lista con cierta forma, sino una lista cualquiera, entonces se manda sin los brackets,,, si la
  # mandas con bracktes es para decirle que forma tiene que tener la lista en especial, por pattern matching

  defp sum_l([head | tail], n), do: sum_l(tail, head + n)
end

defmodule Sort do
  def ascending([]), do: []
  def ascending([a]), do: [a]

  def ascending(list) do
    half_size = div(Enum.count(list), 2)
    {list_a, list_b} = Enum.split(list, half_size)

    merge(
      ascending(list_a),
      ascending(list_b),
      []
    )
  end

  # para concatenar listas ++
  defp merge([], list_b, lista_hecha), do: lista_hecha ++ list_b
  defp merge(list_a, [], lista_hecha), do: lista_hecha ++ list_a

  defp merge([head_a | tail_a], list_b = [head_b | _], lista_hecha) when head_a <= head_b do
    merge(tail_a, list_b, lista_hecha ++ [head_a])
  end

  defp merge(list_a = [head_a | _], [head_b | tail_b], lista_hecha) when head_a > head_b do
    merge(list_a, tail_b, lista_hecha ++ [head_b])
  end
end
