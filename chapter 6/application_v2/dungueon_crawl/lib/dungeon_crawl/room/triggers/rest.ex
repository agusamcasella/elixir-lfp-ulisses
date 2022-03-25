defmodule DungeonCrawl.Room.Triggers.Rest do
  @behaviour DungeonCrawl.Room.Trigger


  def run(character, %DungeonCrawl.Room.Action{id: :rest}) do
    IO.inspect("Se helea*_ ")
    update_character = DungeonCrawl.Character.heal(character)
    {update_character, :rest}
    # {character, :ok}
  end

  def run(character, %DungeonCrawl.Room.Action{id: :forward}) do
    {character, :forward}
  end
end
