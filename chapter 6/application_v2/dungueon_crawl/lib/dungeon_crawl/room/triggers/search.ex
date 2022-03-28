defmodule DungeonCrawl.Room.Triggers.Search do
  alias Mix.Shell.IO , as: Shell
  @behaviour DungeonCrawl.Room.Trigger

  def run(character, %DungeonCrawl.Room.Action{id: :search}) do
    Shell.info("You have found 1000 gold coins.")
    Shell.info("And a potion that restore 10 hp")
    update_character = DungeonCrawl.Character.treasure(character)
    {update_character, :search}
  end
  def run(character, %DungeonCrawl.Room.Action{id: :use_item}) do
    update_character = DungeonCrawl.Character.heal_potion(character)
    {update_character, :use_item}
  end
  def run(character, %DungeonCrawl.Room.Action{id: :forward}) do
    {character, :forward}
  end
end
