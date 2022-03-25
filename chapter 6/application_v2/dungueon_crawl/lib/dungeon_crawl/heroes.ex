#modulo para definir lista de heores predeterminados para que
# el player pueda elejir su character en la aventura.
defmodule DungeonCrawl.Heroes do
  alias DungeonCrawl.Character

  def all() do
    [
      %Character{
        name: "Knight",
        description: "Strong defense consistent dmg",
        hit_points: 20,
        max_hit_points: 20,
        attack_description: "Sword",
        damage_range: 6..8
      },
      %Character{
        name: "Wizard",
        description: "Low hp high magic dmg",
        hit_points: 8,
        max_hit_points: 8,
        attack_description: "Fireball",
        damage_range: 15..20
      },
      %Character{
        name: "Rouge",
        description: "Sneaky high evassion high dmg",
        hit_points: 15,
        max_hit_points: 15,
        attack_description: "Dagger",
        damage_range: 12..16
      },
      %Character{
        name: "Cleric",
        description: "High hp low dmg",
        hit_points: 40,
        max_hit_points: 40,
        attack_description: "Mace",
        damage_range: 2..4
      }
    ]
  end
end
