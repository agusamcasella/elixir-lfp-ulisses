def checkout() do
  with {quantity, _} <- ask_number("Quantity?"),
       {price, _} <- ask_number("Price?") do
    quantity * price
  else
    :error ->
      IO.puts("It's not a number")
  end
end
#En el else block podremos usar pattern mathin convencional  para los valores que no matchean en el bloque del with...
#SI LOS VALORES NO MATCEHAN CON EL WITH NI CON EL ELSE,, ENTONCES SE LEVANTARA UN ERROR.
