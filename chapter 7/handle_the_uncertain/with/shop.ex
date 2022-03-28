def checkout() do
  result =
    with {quantity, _} <- ask_number("Quantity?"),
         {price, _} <- ask_number("Price?"),
         do: quantity * price

  if result == :error, do: IO.puts("It's not a number"), else: result
end

# Aqu8 ponemos pattern machin clauses dentro del with,,, es similiar a como funciona el case
# la gran diferencia de la ejecucion del <-  primero elixir corre la parte derecha del operador,,, lue... El pattern matching
# del lado izquierdo del operador,, va a matchear el resultado del block. Cuando matchea,, elixir ejecuta la sigueinte instruccion.
# Puedes agregar tantos instrucciones dentro del with separandolas por comas,,, La ejecuccion final queda determinada por el do....
# Elixir va a frenar y retornar unmatches value,,, alternativamente tenemos que usar el else block del with. para manejarcuando las cosas no matchean.
