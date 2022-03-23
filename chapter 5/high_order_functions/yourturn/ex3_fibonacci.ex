# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, ...
defmodule Fibonacci do

  #version libro
def fibo(n) do

  Stream.unfold({0, 1}, fn {n1, n2} -> {n1, {n2, n1 + n2}} end)
  |> Enum.take(n)

end


# Stream.unfold(n, fn 0 -> 0 1-> 1 n -> {n-1 + n-2} end)
