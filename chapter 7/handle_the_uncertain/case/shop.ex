defmodule Shop do
  def checkout(price) do
    case ask_number("Quantity?") do
      :error -> IO.puts("It's not a number")
      {quantity, _} -> quantity * price
    end
  end

  def ask_number(message) do
    (message <> "\n")
    |> IO.gets()
    |> Integer.parse()
  end
end
# #en este prpgrama se le pide al usuario meter un num y usamos la funcion de
# IO.gets para obtener el input del usuario.. Sabemos que io.gets es una funcion impura
# Y que puede devolver cualquier cosa, Si no es un numero, parsearlo con Intger.parse podria dar error
# Por lo tanto usamos case, y chequeamos con pattern matching.
