# def checkout() do
#   case ask_number("Quantity?") do
#     :error ->
#       IO.puts("It's not a number")

#     {quantity, _} ->
#       case ask_number("Price?") do
#         :error ->
#           IO.puts("It's not a number")

#         {price, _} ->
#           quantity * price
#       end
#   end
# end
# #si quisieramos atrapar el error al preguntar cantidad y precio, por separado
#   en 2 cases,.. vemos qeu queda demasiado codigo al dope.. para reducir esto usamos
#   mas funciones

def checkout() do
  quantity = ask_number("Quantity?")
  price = ask_number("Price?")
  calculate(quantity, price)
end

def calculate(:error, _), do: IO.puts("Quantity is not a number")
def calculate(_, :error), do: IO.puts("Price is not a number")
def calculate({quantity, _}, {price, _}), do: quantity * price
# aun asi puede fallar todavia,, por mas que qeudo menos codigo que la anterior,,, no se estan contemplando todos los casos todavia
#necesitariamos tenerlas en cuenta tambien.
