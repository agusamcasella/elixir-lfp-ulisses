defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room
  alias DungeonCrawl.Room.Triggers
  import DungeonCrawl.Room.Action
  defstruct description: nil, actions: [], trigger: nil , chances: nil

  def all,
    do: [
      %Room{
        description: "You can see the light of day. You found the exit!",
        actions: [forward()],
        trigger: Triggers.Exit,
        chances: 0#
      },
      %Room{
        description: "You can see an enemy blocking your path.",
        actions: [forward()],
        trigger: Triggers.Enemy,
        chances: 2
      }
    ]
end
