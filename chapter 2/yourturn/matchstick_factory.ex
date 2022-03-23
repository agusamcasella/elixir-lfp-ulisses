defmodule MatchstickFactory do
  def boxes(sticks) do
    cant_big = div(sticks,50)
    resto_big = rem(sticks,50)
    cant_medium = div(resto_big,20)
    resto_medium = rem(resto_big,20)
    cant_small = div(resto_medium,5)
    resto_small = rem(resto_medium,5)

    %{big: cant_big, medium: cant_medium, remaining_matchsticks: resto_small, small: cant_small}
  end
end
