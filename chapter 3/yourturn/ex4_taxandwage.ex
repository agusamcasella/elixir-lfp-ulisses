defmodule TaxWageCalculator do
  def tax_cal(salary) when is_integer(salary) do
   cal(salary)
  end

  defp cal(salary) when salary<2000 do
    %{tax: "none",wage: salary}
  end
  defp cal(salary) when salary<=3000 do

    %{tax: salary*0.05,wage: salary}
  end
  defp cal(salary) when salary<6000 do

    %{tax: salary*0.1,wage: salary}
  end
  defp cal(salary) do

    %{tax: salary*0.15,wage: salary}
  end
end
