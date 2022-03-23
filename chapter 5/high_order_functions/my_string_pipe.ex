defmodule PipeOperator do
  # para demostrar como funciona el pipe operator
  # operador que te deja encadenar la llamada de funciones
  # es decir realiza una funcion y con el resultado de esa funcion se va a la siguiente
  # |>

  # version 1
  def capitalize_words(title) do
    words = String.split(title)
    capitalized_words = Enum.map(words, &String.capitalize/1)
    Enum.join(capitalized_words, " ")
  end

  # version 2 encadenando la llamada de las funcioens modo vieja escuela
  def capitalizes_words(title) do
    Enum.join(
      Enum.map(
        String.split(title),
        &String.capitalize/1
      ),
      " "
    )
  end

  # con pipe operator
  # luego del do, se devolveria solamente lo que sea el title
  # pero como esta luego el pipe operator,,, ese resultado qeu serai el title pelado
  # se lo pasa al split(), y aplica split(title) divide por palabras
  # luego el resultado de ese split se lo pasa a map(con capitalize) para poner la primera letra mayuscula en cda string
  # y luego se los joinea en un string solo nuevamente con espacios

  # basicamente pasa el resultado de la funcion anterior al |> a la siguiente funcion

  def capitalize_words_con_pipe(title) do
    title
    |> String.split()
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(" ")
  end

  # version 4 con pipe y funciones auxiliares

  def capitalize_words_pipe_aux(title) do
    title
    |> String.split()
    |> capitalize_all
    |> join_with_whitespace
  end

  def capitalize_all(words) do
    Enum.map(words, &String.capitalize/1)
  end

  def join_with_whitespace(words) do
    Enum.join(words, " ")
  end
end
