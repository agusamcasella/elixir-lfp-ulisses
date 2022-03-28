defmodule DungeonCrawl.Room.Triggers.Rest do
  @behaviour DungeonCrawl.Room.Trigger


  def run(character, %DungeonCrawl.Room.Action{id: :rest}) do

    update_character = DungeonCrawl.Character.heal(character)
    {update_character, :rest}
    # {character, :ok}
  end

  def run(character, %DungeonCrawl.Room.Action{id: :use_item}) do
    update_character = DungeonCrawl.Character.heal_potion(character)
    {update_character, :use_item}
  end

  def run(character, %DungeonCrawl.Room.Action{id: :forward}) do
    {character, :forward}
  end
end
