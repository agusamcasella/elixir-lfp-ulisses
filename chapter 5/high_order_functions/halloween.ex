defmodule Halloween do
  def give_candy(kids) do
    ~w(chocolate jelly mint) # ~w es el shortcut para listas de palabras.
    |> Stream.cycle()
    |> Enum.zip(kids)
  end
end
