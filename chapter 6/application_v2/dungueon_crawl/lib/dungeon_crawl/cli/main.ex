# modulo del main,,, el cual llevara el
# "hilo de ej" del programa.
defmodule DungeonCrawl.CLI.Main do
  # alias para la shell,, para tener acceso a la consola mas rapido
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.CLI.BaseCommands

  ## funcion de empezar el juego
  def start_game do
    mensaje_bienvenida()
    caminar(creacion_pj(difficulty_choice()), DungeonCrawl.Room.all())
  end

  defp mensaje_bienvenida do
    Shell.info("=== Bienvenido a la Dungeon Crawl ===")
    Shell.prompt("Presione Enter para crear su personaje...")
  end

  def creacion_pj(difficulty) do
    Map.put(DungeonCrawl.CLI.HeroesChoice.start(), :difficulty, difficulty)

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
    # |> Enum.map(fn room = %{chances: chances_value} -> List.duplicate(room, chances_value+player.chances_of_escaping) end)
    |> Enum.map(fn room = %{chances: chances_value} ->
      prob_rooms(room, chances_value, player.chances_of_escaping, player.difficulty)
    end)

    # |> Enum.map (prob_rooms(room = %{chances: chances_value}, chances_value, player.chances_of_escaping,player.difficulty))
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

  defp handle_action_result({player, :exit}) do
    Shell.info("You found the exit. You won the game. Congratulations!")
    guardar_score(player)
  end

  defp handle_action_result({player, _}) do
    caminar(DungeonCrawl.Character.more_chances_of_escaping(player), DungeonCrawl.Room.all())
  end

  # falta def la dificulty chocie

  # funcion para fijar las prob de los rooms
  # segun dificultad y las chacnes del jugador de escapar
  defp prob_rooms(
         room = %{trigger: DungeonCrawl.Room.Triggers.Exit},
         chances_room,
         chances_of_escaping,
         difficulty
       ) do
    List.duplicate(room, (chances_room + chances_of_escaping) * difficulty)
  end

  defp prob_rooms(
         room = %{trigger: DungeonCrawl.Room.Triggers.Rest},
         chances_room,
         _chances_of_escaping,
         difficulty
       ) do
    List.duplicate(room, chances_room * difficulty)
  end

  defp prob_rooms(room = %{}, chances_room, _chances_of_escaping, _difficulty) do
    List.duplicate(room, chances_room)
  end

  defp difficulty_choice() do
    Shell.info("Antes de empezar elija la dificultad.")

    lista_dificultades = lista_de_dificultades()

    # toma el enum que le tira la ant funcion imprime y espera una respuesta en la consola
    Shell.info("Elija la opcion deseada:
              1) Easy
              2) Medium
              3) Hard
    ")

    user_response =
      Shell.prompt("Seleccione su opcion")
      |> parse_answer_to_integer

    # user_response |> IO.inspect(label: "Respuesta")
    find_by_index(lista_dificultades, user_response)
  end

  defp lista_de_dificultades do
    [4, 2, 1]
  end

  defp find_by_index(lista_de_dif, n) do
    Enum.at(lista_de_dif, n)
  end

  def guardar_score(player) do
    # usa sin el ! es mas comnun,,, y luego tratar el error con un case
    # segun el retorno del read.
    # case File.read(
    #        "/Users/agusamcasella/Desktop/elixir-lfp-ulisses/chapter 6/application_v2/dungueon_crawl/top_scores.txt"
    #      ) do
    #   {:ok, content} ->
    #     File.write(
    #       "/Users/agusamcasella/Desktop/elixir-lfp-ulisses/chapter 6/application_v2/dungueon_crawl/top_scores.txt",
    #       content <> "Player_name: #{player.usr_name} Score: #{player.score} \n"
    #     )
    #     IO.inspect(content, label: "elarchivo->")
    #   {:error, _} ->
    #     File.write(
    #       "/Users/agusamcasella/Desktop/elixir-lfp-ulisses/chapter 6/application_v2/dungueon_crawl/top_scores.txt",
    #       "\n Player_name: #{player.usr_name} - Score: #{player.score}"
    #     )
    # end
      IO.inspect("#{player.usr_name} as", label: "usrname guardado")
    {:ok, file} = File.open("/Users/agusamcasella/Desktop/elixir-lfp-ulisses/chapter 6/application_v2/dungueon_crawl/top_scores.txt", [:write, :append])
    file |> IO.binwrite("\nPlayer_name: #{player.usr_name} Score: #{player.score} holahola")
    file |> File.close
  end
end
