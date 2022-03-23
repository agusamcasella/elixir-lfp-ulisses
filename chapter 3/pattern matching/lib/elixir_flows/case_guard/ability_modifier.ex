result = case Integer.parse(user_input) do
  :error -> "Invalid ability score: #{user_input}"
  {ability_score, _} when ability_score >= 0 -> ability_modifier = (ability_score - 10) / 2
  "Your ability modifier is #{ability_modifier}"
end
#en el flow del case se pueden usar guard clauses para contorlar en que momento del case entras.
