defmodule DungeonCrawl.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  def start_game do
    welcome_message()
    Shell.prompt("Press Enter to continue")

    crawl(hero_choice(), DungeonCrawl.Room.all())
  end

  defp welcome_message do
    Shell.info("== Dungeon Crawl ===")
    Shell.info("You awake in a dungeon full of monsters.")
    Shell.info("You need to survive and find the exit.")
  end

  defp crawl(%{hit_points: 0}, _) do
    Shell.prompt("")
    Shell.cmd("clear")
    Shell.info("Unfortunately your wounds are too many to keep walking.")
    Shell.info("You fall onto the floor without strength to carry on.")
    Shell.info("Game over!")
    Shell.prompt("")
  end

  defp crawl(character, rooms) do
    Shell.info("You keep moving forward to the next room.")
    Shell.prompt("Press Enter to continue")
    Shell.cmd("clear")
    Shell.info(DungeonCrawl.Character.current_stats(character))
    # tirada = Enum.random(1..100)

    # IO.inspect(rooms, label: "Antes de la duplicada -->")


 # |>Enum.find(fn %{chances: min..max} -> min<=tirada and max>= tirada end )
    # Shell.info("despues de la duplicada |")
    # IO.inspect(rooms_duplicado)

    # rooms_duplicado = Enum.map(rooms,fn room ->
    #   #IO.inspect(room, label: "Room dentro de duplicando -->")
    #   List.duplicate(room, 3) #|> IO.inspect(label: "AAAAAAAAAAAAA =======>")
    # end)
    # #se usa el flaten para pasar de listas de listas,, para lista de elementos comun... basicamente "quita brackets"
    # |> List.flatten()

    # # |>Enum.find(fn %{chances: min..max} -> min<=tirada and max>= tirada end )
    # # Shell.info("despues de la duplicada |")
    # # IO.inspect(rooms_duplicado)
    # rooms_duplicado

    #se usa el flaten para pasar de listas de listas,, para lista de elementos comun... basicamente "quita brackets"


    rooms

    |>Enum.map(fn room = %{chances: chances_value} ->
      List.duplicate(room, chances_value) #|> IO.inspect(label: "AAAAAAAAAAAAA =======>")
    end)
    |> List.flatten()


    |> Enum.random()# aca selecciono uno random del arrelgo
    |> DungeonCrawl.CLI.RoomActionsChoice.start()
    |> trigger_action(character)
    |> handle_action_result
  end

  defp hero_choice do
    hero = DungeonCrawl.CLI.HeroChoice.start()
    %{hero | name: "You"}
  end

  defp trigger_action({room, action}, character) do
    Shell.cmd("clear")
    room.trigger.run(character, action)
  end

  defp handle_action_result({_, :exit}),
    do: Shell.info("You found the exit. You won the game. Congratulations!")

  defp handle_action_result({character, _}),
    do: crawl(character, DungeonCrawl.Room.all())
end
