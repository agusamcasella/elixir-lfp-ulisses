def checkout() do
  try do
    {quantity, _} = ask_number("Quantity?")
    {price, _} = ask_number("Price?")
    quantity * price
  rescue
    MatchError -> "It's not a number"
  end
end

#el codigo del try es el happy path,,, o camino en el cual no se piensan en los erroes que pueden haber
#solamente se tiran lineas de codigo las cuales van a correr sin errores... y en el rescue ,,, manejamos
#los casos que vayamos capturando para tratar los errores que pueda haber en cda linea.
#por ej... aca se pregunta quantity,, y precio,,, y cualquiera de las 2 puede soltar error matematico
#con el mensaje qu no es un numero,,, y eso se lo trata en el catch.
