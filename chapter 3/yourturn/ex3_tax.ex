#cuaando caes en algo de este estilo muy de if,, revisar pattern maching o
#funciones de control de flow como case,,, cond,,
 # defmodule TaxCalculator do
#   def tax_cal(salary) do
#     if salary < 2000 do
#       "none"
#     else
#       if salary <= 3000 do
#         salary * 0.05
#       else
#         if salary < 6000 do
#           salary * 0.1
#         else
#           salary * 0.15
#         end
#       end
#     end
#   end
# end


defmodule TaxCalculator do
  def tax_cal(salary) when is_integer(salary) do
   cal(salary)
  end

  defp cal(salary) when salary<2000 do
    "none"
  end
  defp cal(salary) when salary<=3000 do
    salary*0.05
  end
  defp cal(salary) when salary<6000 do
    salary*0.1
  end
  defp cal(salary) do
    salary*0.15
  end
end
#con tab te salen las funciones macros? puede ser
