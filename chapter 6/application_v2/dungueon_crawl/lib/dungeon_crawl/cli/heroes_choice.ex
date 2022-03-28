defmodule DungeonCrawl.CLI.HeroesChoice do
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.CLI.BaseCommands

  def start do
    Shell.cmd("Clear")
    Shell.info("Bienvenido a la seleccion de Pj")
    Shell.info("Elija la opcion deseada: ")
    lista_heroes = lista_de_heroes()

    user_response =
      lista_de_heroes()
      ## retorna options(la lista de heroes)
      |> display_options
      |> generate_question_options("Cual te gustaria")
      # toma el enum que le tira la ant funcion imprime y espera una respuesta en la consola
      |> Shell.prompt()
      |> parse_answer_to_integer

    # user_response |> IO.inspect(label: "Respuesta")
    find_by_index(lista_heroes, user_response)
    |> confirm_hero()

    # Shell.cmd("clear")
    # Shell.info("Start by choosing your hero:")

    # heroes = DungeonCrawl.Heroes.all()
    # find_hero_by_index = &Enum.at(heroes, &1)

    # heroes
    # |> display_options
    # |> generate_question_options("Gen")
    # |> Shell.prompt()
  end

  defp lista_de_heroes do
    DungeonCrawl.Heroes.all()
  end

  defp find_by_index(lista_de_heroes, n) do
    Enum.at(lista_de_heroes, n)
  end

  defp confirm_hero(heroe) do
    Shell.info("El pj seleccionado es: #{heroe.name} - #{heroe.description}")
    if Shell.yes?("Desea comenzar la aventura?") do
       name = Shell.prompt("Ahora ingrese su nombre antes de comenzar")
    #    IO.inspect(name)
    #   %{ heroe | name: String.capitalize(name)}
    # IO.inspect(heroe)

    Map.put(heroe, :usr_name, String.replace(name, "\n", "")) #crea un nuevo atributo en el map
      #{heroe,name} ##se devuelve el pj que selecciono el usuario.
    else
      start() #se comienza de nuevo con la eleccion de personaje si no le gusto su pj
    end
  end
end
