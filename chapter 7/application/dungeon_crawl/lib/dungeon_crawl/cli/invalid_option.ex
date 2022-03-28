defmodule DungeonCrawl.CLI.InvalidOptionError do
  defexception message: "Invalid Option"
end
#como vemos se peuden creas nuestras propias excepciones
#al igual que java,, sinplemente defines el modulo de tu exccepcion y defines la excecion con su mensaje.
#despues dentro de tu codigo en algun rescue o algo del estilo,, catcehas el error y lo tratas como quieras,,
