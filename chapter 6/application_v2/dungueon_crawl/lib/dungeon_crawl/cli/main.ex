# modulo del main,,, el cual llevara el
# "hilo de ej" del programa.
defmodule DungeonCrawl.CLI.Main do
  # alias para la shell,, para tener acceso a la consola mas rapido
  alias Mix.Shell.IO, as: Shell

  ## funcion de empezar el juego
  def start_game do
    mensaje_bienvenida()

    caminar(creacion_pj(), DungeonCrawl.Room.all())
  end

  defp mensaje_bienvenida do
    Shell.info("=== Bienvenido a la Dungeon Crawl ===")
    Shell.prompt("Presione Enter para crear su personaje...")
  end

  def creacion_pj do
    DungeonCrawl.CLI.HeroesChoice.start()

    # {heroe,nombre} = DungeonCrawl.CLI.HeroesChoice.start()
    # nombre |> IO.inspect(label: "nombre")
    # heroe |> IO.inspect(label: "heroe")

    # %{heroe | name: "#{nombre}"} ##se le cambia el atributo nombre al mapa de heroe.
    # IO.inspect(%{heroe | name: "#{nombre}"})
    # IO.inspect(nombre)
  end

  defp caminar(player, _room) when player.hit_points == 0 do
    Shell.cmd("clear")

    Shell.info(
      "#{player.usr_name} Haz perdido todas tus fuerzas, desafortunadamente no pudiste escapar. "
    )

    Shell.info("Game Over")
    Shell.prompt("")
  end

  defp caminar(player, rooms) do
    Shell.info("You keep moving forward to the next room.")
    Shell.prompt("Press Enter to continue")
    Shell.cmd("clear")
    Shell.info(DungeonCrawl.Character.current_stats(player))

    rooms
    |> Enum.map(fn room = %{chances: chances_value} ->
      List.duplicate(room, chances_value+player.chances_of_escaping)
    end)
    |> List.flatten()
    |> Enum.random()
    # falta definir
    |> DungeonCrawl.CLI.RoomActionsChoice.start()
    |> trigger_action(player)
    |> handle_action_result
  end

  defp trigger_action({room, action}, player) do
    Shell.cmd("clear")
    room.trigger.run(player, action)
  end

  defp handle_action_result({_, :exit}),
    do: Shell.info("You found the exit. You won the game. Congratulations!")

  defp handle_action_result({player, _}) do

    caminar(DungeonCrawl.Character.more_chances_of_escaping(player), DungeonCrawl.Room.all())
  end
end
