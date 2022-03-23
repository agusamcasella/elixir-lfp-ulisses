defmodule GeneralStore do
  def test_data do
    [
      %{title: "Longsword", price: 50, magic: false},
      %{title: "Healing Potion", price: 60, magic: true},
      %{title: "Rope", price: 10, magic: false},
      %{title: "Dragon's Spear", price: 100, magic: true}
    ]
  end

#la stop condition es si la lista es facia, se devuelve un elemento o lista nula.
  def filter_items([], magic: magic), do: []

  #en el argumento de la funcion, se toma el valor de magic en el item magic, mediante pattern matching
  #para luego ser usado en la guarda para compararlo con el magic del filtro
  #y si coinciden se pone el item en el principio de la fila y se va a filtar el resto
  def filter_items([item = %{magic: item_magic} | incoming_items], magic: filter_magic) when item_magic == filter_magic  do
    [item | filter_items(incoming_items, magic: filter_magic)]
  end

  #en el argumento de la funcion no se toma el magic del item, porq en este caso, es
  #ya si no se filtro mediante su magic en el 17,, este es el caso que se deja el item fuera
  #como se ve en la linea 26 se filtra el resto de la lista, dejando fuera el item

  def filter_items([item | incoming_items], magic: filter_magic) do
    filter_items(incoming_items, magic: filter_magic)
  end

end
