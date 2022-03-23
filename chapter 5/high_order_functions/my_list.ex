defmodule MyList do
  # enchanted_items = [
  #   %{title: "Edwin's Longsword", price: 150},
  #   %{title: "Healing Potion", price: 60},
  #   %{title: "Edwin's Rope", price: 30},
  #   %{title: "Dragon's Spear", price: 100}
  # ]
  # stop condition, recive lista vacia y no hace nada
  def each([], _function), do: nil
  # cuando hay elementos de la lista, se aplica la fucion que se trae del arg al cabezal y
  # se vuelve a llamar al each para el resto de la lista.
  def each([head | tail], function) do
    function.(head)
    each(tail, function)
  end

  # otra funcion
  # stop condition cuando la lista es vacia
  def map([], _function), do: []
  # usa la sintaxis de la lista para hacer una nueva lista, en la cabecera de la nueva lista
  # tiene el valoe de retorno dado por la funcion, y en la cola tiene la llamada recursiva de la funcion map

  def map([head | tail], function) do
    [function.(head) | map(tail, function)]
  end

  # otra high order
  # funcion para averiguar la suma de los precios
  # arg 1 lista para ser navegada, arg 2 valor iniciar que se va a acumular durante la nav
  # arg 3 la funcion que se va a aplicar en los items de la lista y el valor acumulado generando un/
  # nuevo valoe acumulado

  # primer paso, lista vacia
  def reduce([], acc, _function), do: acc
  # itera recursivamente en cada elemento actualizando el valor acumulado
  def reduce([head | tail], acc, function) do
    reduce(tail, function.(head, acc), function)
  end

  # funcion para filtrar items de la lista

  # stop condition lista vacia no hace nada
  def filter([], _function), do: []
  # filtrar, toma la lista como primer arg y como segundo la funcion a aplicar en cda item
  # luego pregunta si el elemento cumple condicion arma la lista con ese elemento de head y filtra la tail
  # sino filtra directamente la tail, es decir en la prox ejecucion de la funcion filter,, la tail va a ser la lista entera, se dejo de lado la head de la lista
  # para correr en consola MyList.filter(["a","b","c","d"], &(&1 > "b"))
  # esa anterior linea, filtraria los que son mas grandes que b
  def filter([head | tail], function) do
    if function.(head) do
      [head | filter(tail, function)]
    else
      filter(tail, function)
    end
  end
  #en el libro las escribes para saber como hacerlas, y entenderlas, pero en el modulo
  #de Enum de elixir estan todas estas funciones, listas para ser utilizadas.
  #y muchas mas,,, como count, join, member?, sort, sum, uniq, etc
end
