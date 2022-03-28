defmodule DungeonCrawl.Character do
  alias DungeonCrawl.Character
  alias DungeonCrawl.InventoryItems
  alias Mix.Shell.IO, as: Shell

  import DungeonCrawl.CLI.BaseCommands

  defstruct name: nil,
            description: nil,
            hit_points: 0,
            max_hit_points: 0,
            attack_description: nil,
            damage_range: nil,
            wealth: 0,
            chances_of_escaping: 0,
            # normal_mode 2easy mode,,0.5 hard mode.
            difficulty: 1,
            score: 0,
            reward: 0,
            inventory: [%InventoryItems{name: "Potion", quantity: 0}]

  @type t :: %Character{
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

  def current_stats(character) when character.inventory == nil do
    "Player Stats\nHP: #{character.hit_points}/#{character.max_hit_points} \nWealth:#{character.wealth} gold coins. Chances=#{character.chances_of_escaping}. Difficulty level = #{character.difficulty}, Score = #{character.score}\n Inventory: No posees nada en el inv"
  end

  def current_stats(character) do
    Shell.info("Inventory:")
    display_options(character.inventory)

    "Player Stats\nHP: #{character.hit_points}/#{character.max_hit_points} \nWealth:#{character.wealth} gold coins. Chances=#{character.chances_of_escaping}. Difficulty level = #{character.difficulty}, Score = #{character.score}\n"
  end

  def heal(character) do
    max = character.max_hit_points
    %{character | hit_points: max}
  end

  def heal_potion(character)  do
    current_hp = character.hit_points
    after_heal = current_hp + 10

    if after_heal <= character.max_hit_points do
      %{character | hit_points: after_heal}
    else
      %{character | hit_points: character.max_hit_points}
    end
  end

  def take_damage(character, damage) do
    new_hit_points = max(0, character.hit_points - damage)
    %{character | hit_points: new_hit_points}
  end

  def treasure(character) do
    new_wealth = 1000 + character.wealth
    new_score = character.score + 500
    updated_character = agregar_potion(character)
    %{updated_character | wealth: new_wealth}
    %{updated_character | score: new_score}
  end

  def agregar_potion(character) do
    updated_character_inv =
      Enum.map(character.inventory, fn item = %{name: "Potion", quantity: cant_value} ->
        Map.put(item, :quantity, cant_value + 1)
      end)

    %{character | inventory: updated_character_inv}
  end

  def more_chances_of_escaping(character) do
    new_chances = character.chances_of_escaping + 1
    %{character | chances_of_escaping: new_chances}
  end
end
