defmodule DungeonCrawl.Character do
  alias DungeonCrawl.Character
  defstruct name: nil,
            description: nil,
            hit_points: 0,
            max_hit_points: 0,
            attack_description: nil,
            damage_range: nil,
            wealth: 0,
            chances_of_escaping: 0

  @type t :: %Character {
    name: String.t(),
    description: String.t(),
    hit_points: non_neg_integer,
    max_hit_points: non_neg_integer,
    attack_description: String.t(),
    damage_range: Range.t()
    }
# "override de p4"
  #  se usa para poder imprimirlo como un string,,, Sino se peude directamente hacer "#{map.key}"
    defimpl String.Chars do
      def to_string(character), do: character.name
    end

  def current_stats(character) do
    "Player Stats\nHP: #{character.hit_points}/#{character.max_hit_points} \nWealth:#{character.wealth} gold coins. Chances=#{character.chances_of_escaping}"
  end

  def heal(character) do
    max = character.max_hit_points
    %{character | hit_points: max}
  end

  def take_damage(character, damage) do
    new_hit_points = max(0, character.hit_points - damage)
    %{character | hit_points: new_hit_points}
  end

  def treasure(character) do
    new_wealth = 1000 + character.wealth
    %{character | wealth: new_wealth}
  end

  def more_chances_of_escaping(character) do
    new_chances = character.chances_of_escaping + 1
    %{character | chances_of_escaping: new_chances}
  end

end
