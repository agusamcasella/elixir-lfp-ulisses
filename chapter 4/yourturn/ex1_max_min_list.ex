defmodule MyList do
  def max([]), do: nil #base, en el vacio no hay max
  def max([a]), do: a  #2do base, si tengo 1 solo elemento ese es max
  def max([a, b | rest]) when a >= b, do: find_max(rest, a)
  def max([a, b | rest]) when a < b, do: find_max(rest, b)
  #esto seria el disparador de la recursion misma solo se va a  hacer 1 vez este paso
  #cualquiera de las lineas 2 3 4 5 se aplica 1 vez para disparar la recursion de find_max
#en 4 y 5,, se toma el mayor de los primeros 2 elementos de la lista
#y te lo llevas para comparar con el resto de la lista
#recordar que es recursion, por lo que empiezas (suponeindo lista de 3 elementos)
#tomas si es 1,2,3 tomas 1 y 2,,, comparas cual es mayor,, segun lineas 4 o 5
# y con el que sea mayor te vas a seguir recorriendo la lista comparando al resto de los
#numeros con ese que te fuiste.

#aqui va la recursion, donde se busca si es vacia la lista, el q se paso como max queda
#seria la stop condition linea 19
#sino, se compara contra el primer elemento y se vuelve a tirar recrusion
#siendo que se va a buscar en el resto de la lista, con o bien el max o el head segun sea el mas grande de los dos
  defp find_max([],max), do: max
  defp find_max([head|tail],max)  when max <= head, do: find_max(tail,head)
  defp find_max([head|tail],max)  when max > head, do: find_max(tail,max)

  def min([]), do: nil
  def min([a]), do: a
  def min([a, b | tail]) when a<=b, do: find_min(tail, a)
  def min([a, b | tail]) when a>b, do: find_min(tail, b)

  defp find_min([],min) do
    min
  end
  defp find_min([head | tail],min) when head<=min do
     find_min(tail,head)
  end
  defp find_min([head | tail],min) when head>min do
    find_min(tail,min)
  end

  ##diferentes formas de escribir las funciones, despues del def viene la funcion con
  #argumentos y despues si lleva guardas se peude poner , do: y mandar a hacer algo de una
  #sino, si es mas larga la funcion, simeplemente se deja normal, despues de la guarda
  #el do de siempre, y debajo va el body, y luego end




end#ModuloMyList
