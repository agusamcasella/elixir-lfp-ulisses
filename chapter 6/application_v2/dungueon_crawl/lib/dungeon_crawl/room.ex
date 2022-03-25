defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room
  alias DungeonCrawl.Room.Triggers
  import DungeonCrawl.Room.Action
  defstruct description: nil, actions: [], trigger: nil, chances: nil

  def all() do
    [
      %Room{
        description: "You can see the light of day. You found the exit!",
        actions: [forward()],
        trigger: Triggers.Exit,
        chances: 0
      },
      %Room{
        description: "You can see an enemy blocking your path.",
        actions: [forward(), battle()],
        trigger: Triggers.Enemy,

        chances: 10
      },
      %Room{
        description: "You see a room full of rare chest.",
        actions: [forward(),search()],
        trigger: Triggers.Search,

        chances: 3
      },
      %Room{
        description: "You see a secure room full of beds",
        actions: [forward(), rest()],
        trigger: Triggers.Rest,

        chances: 6
      }
    ]
  end
end
