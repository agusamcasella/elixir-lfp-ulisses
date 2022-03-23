user_input = IO.gets "Write your ability score: "
result = case Integer.parse(user_input) do
  end:error ->
    "Invalid ability score: #{user_input}"
  {ability_score, _} ->
  ability_modifier = (ability_score - 10) / 2
  "Your ability modifier is #{ability_modifier}"
end
IO.puts result

#aprovechar que el case devuelve un valor para solamente escribir el codigo de IO.puts 1 sola vez
#es de buena practica
