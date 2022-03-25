defmodule DungeonCrawl.CLI.BaseCommands do
  alias Mix.Shell.IO, as: Shell

  ## despliega las opciones en la consola
  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      Shell.info("#{index} - #{option}")
    end)

    options
  end



  ## recibe la pregunta y las opciones, y devuelve la pregunta con las opciones en la consola
  def generate_question_options(options, question) do
    options = Enum.join(1..Enum.count(options), ",")
    "#{question}? [#{options}]\n"
  end

  ## recibe una respuesta y la parsea a integer
  def parse_answer_to_integer(answer) do
    {option, _} = Integer.parse(answer)
    option - 1
  end


end
