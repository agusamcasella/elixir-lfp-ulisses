defmodule WordBuilder do
  def build_no_funciona(alphabet, positions) do
    letters = Enum.map(positions, String.at(alphabet))
    Enum.join(letters)
  end

  ## esto anterior no funciona, porq,,, porq String.at no puede tomar 1 solo argumento
  # ya que String.at/2 necesita de 2 arg para funcionar, funciones con distintas aridades sin importar nombre son otras funcines
  ##


  # version que funciona pero no usa function-capturing-syntax
  # esto nos permite con la funcion anonima hacer aplicacion parcial, que permite setear valores a los argumentos
  # de otras funciones, sin invocar a la funcion anterior, dandonos la flexibilidad de decidir cuando se van a ejecutar.
  def build(alphabet, positions) do
    partial = fn at -> String.at(alphabet, at) end

    letters = Enum.map(positions, partial)
    Enum.join(letters)
  end

  # version con capturing syntax,,, esto resuelve map, con sus posiciones y demas los deja en letters/
  # y luego cuando eso ya esta resuelto recien ahi se aplica join con letters.
  def builder(alphabet, positions) do
    letters = Enum.map(positions, &String.at(alphabet, &1))
    Enum.join(letters)
  end
end



  # IO.inspect() // similar a console.log()
