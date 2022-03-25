defmodule DungeonCrawl.Room.Triggers.Search do
  alias Mix.Shell.IO , as: Shell
  @behaviour DungeonCrawl.Room.Trigger

  def run(character, %DungeonCrawl.Room.Action{id: :search}) do
    Shell.info("You have found 1000 gold coins.")
    update_character = DungeonCrawl.Character.treasure(character)
    {update_character, :search}
  end

  def run(character, %DungeonCrawl.Room.Action{id: :forward}) do
    {character, :forward}
  end
end
