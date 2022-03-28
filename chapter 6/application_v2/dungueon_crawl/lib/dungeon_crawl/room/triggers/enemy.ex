defmodule DungeonCrawl.Room.Triggers.Enemy do
  @behaviour DungeonCrawl.Room.Trigger
  alias Mix.Shell.IO, as: Shell

  def run(character, %DungeonCrawl.Room.Action{id: :battle}) do
    enemy = Enum.random(DungeonCrawl.Enemies.all())
    Shell.info(enemy.description)
    Shell.info("The enemy #{enemy.name} wants to fight.")
    Shell.info("You were prepared and attack first.")
    {updated_char, _enemy} = DungeonCrawl.Battle.fight(character, enemy)
    new_score = updated_char.score + enemy.reward
    updatedv_char = %{updated_char | score: new_score}
    {updatedv_char, :forward}
  end
  def run(character, %DungeonCrawl.Room.Action{id: :use_item}) do
    enemy = Enum.random(DungeonCrawl.Enemies.all())
    Shell.info(enemy.description)
    Shell.info("The enemy #{enemy.name} see you distracted.")
    Shell.info("You start running down the hall after healing.")
    Shell.info("But the enemy #{enemy.name} makes an attack of opportunity.")
    update_character = DungeonCrawl.Character.heal_potion(character)

    {updated_character, _enemy} = DungeonCrawl.Battle.attack_of_opportunity(update_character,enemy)
    {updated_character, :use_item}
  end
  def run(character, %DungeonCrawl.Room.Action{id: :forward}) do
    enemy = Enum.random(DungeonCrawl.Enemies.all())
    Shell.info(enemy.description)
    Shell.info("The enemy #{enemy.name} wants to fight.")
    Shell.info("You start running down the hall.")
    Shell.info("The enemy #{enemy.name} makes an attack of opportunity.")
    {updated_char, _enemy} = DungeonCrawl.Battle.attack_of_opportunity(character,enemy)
    {updated_char, :forward}
  end
end
