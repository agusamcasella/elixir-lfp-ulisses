defmodule TRFactorial do
  def of(n), do: factorial_of(n, 1)
  defp factorial_of(0, acc), do: acc
  defp factorial_of(n, acc) when n > 0, do: factorial_of(n - 1, n * acc)
  end
 #una funcion tail-recursive, una funcion que tiene una llamada recursiva en la ultima expresion
 #lo cual permite al compilador, quitar del stack de memoria a la anterior llamada hecha para poner a la nueva
 #y esto hace uqe el gasto de memoria sea mucho grados menor.
 #no es que el compilador la quite, sino que el compilador la optimiza para q esto suceda
