def dir?(dir) do
  {:ok, %{type: type}} = File.lstat(dir)
  type == :directory
end
# ? es una funcion booleana devuelve si hay o no un directorio
