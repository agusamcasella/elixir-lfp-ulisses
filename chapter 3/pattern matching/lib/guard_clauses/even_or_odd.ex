#is_even y is_odd son llamadas MACROS, funciones ya hechas.
defmodule EvenOrOdd do require Integer
  def check(number) when Integer.is_even(number), do: "even"
  def check(number) when Integer.is_odd(number), do: "odd"
end
#directiva required



##esta version no compilaria porq is_odd esta intentando usar la macro de Integer sin la palabra required.
# defmodule EvenOrOdd do def is_even(number) do
#   require Integer
#       Integer.is_even(number)
#   end
#   def is_odd(number), do: Integer.is_odd(number) end
