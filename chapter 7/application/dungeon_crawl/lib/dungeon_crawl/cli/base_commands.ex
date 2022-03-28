defmodule DungeonCrawl.CLI.BaseCommands do
  alias Mix.Shell.IO, as: Shell
  # importando funciones de libreria Monad..
  use Monad.Operators
  alias Mix.Shell.IO, as: Shell
  import Monad.Result, only: [success: 1, success?: 1, error: 1, return: 1]
  # funciones display y generate question sin manejo de errores

  # def display_options(options) do
  #   options
  #   |> Enum.with_index(1)
  #   |> Enum.each(fn {option, index} ->
  #     Shell.info("#{index} - #{option}")
  #   end)

  #   options
  # end

  # def generate_question(options) do
  #   options = Enum.join(1..Enum.count(options), ",")
  #   "Wich one? [#{options}]\n"
  # end
  # display options con retorno con Monad
  # aqui usamos el retunr de monad para que encierre a la lista de opciones en un success result,,, Es necesario ya que la lista son tipos de monad.
  # Si le pasamos una lista al operador de bind,,, va a tratar de extraer los items y no es lo que queremos..por eos el result.

  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      Shell.info("#{index} - #{option}")
    end)

    return(options)
  end

  # aqui se retorna un string value,, usando la libreria,, es opcional encerrarlo en un resul de monad. La funcion no va a tratar de extraer valores que no son de monads.
  def generate_question(options) do
    options = Enum.join(1..Enum.count(options), ",")
    "Which one? [#{options}]\n"
  end

  # en parseanswer parsear el intger puede resultar en error.. chequeamos usando el case.  cuando sea parseado el resultado a un numero valido
  # usamos success de monad para devolver el resultado wrapeando el numero.
  # find option by index auqi abajo sigue la misma logica.
  def parse_answer(answer) do
    case Integer.parse(answer) do
      :error -> error("Invalid option")
      {option, _} -> success(option - 1)
    end
  end

  def find_option_by_index(index, options) do
    case Enum.at(options, index) do
      nil -> error("Invalid option")
      chosen_option -> success(chosen_option)
    end
  end

  # funcion que parsea la respuesta del usuario a integer,. pero sin tomar erroes en cuenta

  # def parse_answer(answer) do
  #   {option, _} = Integer.parse(answer)
  #   option - 1
  # end

  # funcion que parsea la respuestsa del usuario a entero y toma en cuenta la excepcion creada de invalid option.
  # si se usa el raise,,, para la ejecucion del programa,,, si no se uso un rescue,, el programa frena mostrando el
  # "recorrido del stack"(stack trace)
  # def parse_answer!(answer) do
  #   case Integer.parse(answer) do
  #     :error ->
  #       raise DungeonCrawl.CLI.InvalidOptionError

  #     {option, _} ->
  #       option - 1
  #   end
  # end

  # def find_option_by_index!(index, options) do
  #   Enum.at(options, index) ||
  #     raise DungeonCrawl.CLI.InvalidOptionError
  # end

  # esta es una opcion con throw;; catch,,, la mayor diferencia es qeu la combinacion throw/catch no significa que sea un error.
  # lo que si va a frenar la funcion de throwear un valor que debe de ser capturado... funciona cmo estructura de control de flow de codigo.

  # @invalid_option {:error, "Invalid option"}
  # def parse_answer(answer) do
  #   case Integer.parse(answer) do
  #     :error ->
  #       throw(@invalid_option)

  #     {option, _} ->
  #       option - 1
  #   end
  # end

  # def find_option_by_index(index, options) do
  #   Enum.at(options, index) || throw(@invalid_option)
  # end

  # esta siguiente funcion de ask for option va pareada con la anterior d eparse.answer para catchear el error al tirar la funcion.
  # def ask_for_option(options) do
  #   try do
  #     options
  #     |> display_options
  #     |> generate_question
  #     |> Shell.prompt()
  #     |> parse_answer
  #     |> find_option_by_index(options)
  #   catch
  #     {:error, message} ->
  #       display_error(message)
  #       ask_for_option(options)
  #   end
  # end

  # # y este display es el que se usarioa con las antriores 3 funciones
  # def display_error(message) do
  #   Shell.cmd("clear")
  #   Shell.error(message)
  #   Shell.prompt("Press Enter to continue.")
  #   Shell.cmd("clear")
  # end

  # en esta funcion se le pregunta por el input de un numero
  # usamos integer.parse y chequeamos con un case si el user tipea un numero valido
  #   Y displayeamos un mensaje de error si no lo hace Si tipea el numero valido entonces devolvemos el numero

  def ask_for_index(options) do
    answer =
      options
      |> display_options
      |> generate_question
      |> Shell.prompt()
      |> Integer.parse()

    case answer do
      :error ->
        display_invalid_option()
        ask_for_index(options)

      {option, _} ->
        option - 1
    end
  end

  def display_invalid_option do
    Shell.cmd("clear")
    Shell.error("Invalid option.")
    Shell.prompt("Press Enter to try again.")
    Shell.cmd("clear")
  end

  # # usando Enum.at\2 intentamos encontrar la opcion con el index que dijo el usuario
  # # devuelve nil cuando no encuentra nada,, sino se devuelve la opcion.
  # def ask_for_option(options) do
  #   index = ask_for_index(options)
  #   chosen_option = Enum.at(options, index)

  #   chosen_option ||
  #     (display_invalid_option() && ask_for_option(options))
  # end
  # misma funbcion de ask fir option,, pero trata la excepcion de invalidoption creada por nosotros en el cli
  # Y tambien definimos una manera de imprimir en pantalla el mensaje de la expcecicon
  # esta creada con try y rescue
  # def ask_for_option(options) do
  #   try do
  #     options
  #     |> display_options
  #     |> generate_question
  #     |> Shell.prompt()
  #     |> parse_answer!
  #     |> find_option_by_index!(options)
  #   rescue
  #     e in DungeonCrawl.CLI.InvalidOptionError ->
  #       display_error(e)
  #       ask_for_option(options)
  #   end
  # end

  # def display_error(e) do
  #   Shell.cmd("clear")
  #   Shell.error(e.message)
  #   Shell.prompt("Press Enter to continue.")
  #   Shell.cmd("clear")
  # end

  # ahora un ejemplo para aprovechar las funciones de monad
  # aqui empezamos el pipeline usando return ,, funcion que wrapea las opciones de la lista en un resultado de monad. necesitamoshacerlo porq las listas son monads.. y triggerean otras acciones en el bind operator
  # Luego usamos el ~>> para lasfunciones de pipe, funciona de manera similar a |> pero la diferencia es que el lado derecho del ~>> espera una funcion anonima.
  # el ~>>  decide si se debee ejecutar la siguiente funcion.. si el valor esta con error,,, se la saltea,, sino la ejecuta.
  # gracias al ~>> pordemos manejar el error luego y no inmediatamente cuando el error esta ocurriendo.
  # le resultado del pipeline a una varaible result,, y luego la chequemaos si es sucess,, devolvemos el valor,, sino imprimimos el error

  def ask_for_option(options) do
    result =
      return(options)
      ~>> (&display_options/1)
      ~>> (&generate_question/1)
      ~>> (&Shell.prompt/1)
      ~>> (&parse_answer/1)
      ~>> (&find_option_by_index(&1, options))

    if success?(result) do
      result.value
    else
      display_error(result.error)
      ask_for_option(options)
    end
  end

  def display_error(message) do
    Shell.cmd("clear")
    Shell.error(message)
    Shell.prompt("Press Enter to continue.")
    Shell.cmd("clear")
  end

  ### con with
  # def display_options(options) do
  #   options
  #   |> Enum.with_index(1)
  #   |> Enum.each(fn {option, index} ->
  #     Shell.info("#{index} - #{option}")
  #   end)

  #   options
  # end

  # def generate_question(options) do
  #   options = Enum.join(1..Enum.count(options), ",")
  #   "Which one? [#{options}]\n"
  # end

  # aca  se divde en tres partes la funcion de ask for option.. donde vemos en la primera el display de opciones y get an answer..
  # en la segunda el uso del with para parsear la respeusta dque el usuario elije.. y en la tercera
  # usamos el bloque del else,, para manejar las respuestas invalidas. diciendole al user que pruebe de neuvo con retry
  # def ask_for_option(options) do
  #   answer =
  #     options
  #     |> display_options
  #     |> generate_question
  #     |> Shell.prompt()

  #   with {option, _} <- Integer.parse(answer),
  #        chosen when chosen != nil <- Enum.at(options, option - 1) do
  #     chosen
  #   else
  #     :error -> retry(options)
  #     nil -> retry(options)
  #   end
  # end

  # def retry(options) do
  #   display_error("Invalid option")
  #   ask_for_option(options)
  # end

  # def display_error(message) do
  #   endShell.cmd("clear")
  #   Shell.error(message)
  #   Shell.prompt("Press Enter to continue.")
  #   Shell.cmd("clear")
  # end
end
