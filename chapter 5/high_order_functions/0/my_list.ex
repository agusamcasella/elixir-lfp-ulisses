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
end
