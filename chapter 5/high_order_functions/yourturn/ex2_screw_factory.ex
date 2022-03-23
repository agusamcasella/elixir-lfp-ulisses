defmodule ScrewsFactory do
  ### lazy strategy y mejora ne la cantidad de screws que procesan las maquinas
  # ahora
  def run_lazy_better_machines(pieces) do
    pieces
    # acumula items y cuando se llena o se termina el stream se mandan a procesar a la siguiente funcion del pipe
    |> Stream.chunk(50)
    |> Stream.flat_map(&add_thread/1)
    |> Stream.chunk(100)
    |> Stream.flat_map(&add_head/1)
    |> Stream.chunk(30)
    |>Stream.flat_map(&package/1)
    |> Enum.each(&output/1)
  end

  defp add_thread(pieces) do
    Process.sleep(50)
    Enum.map(pieces, &(&1 <> "--"))
  end

  defp add_head(pieces) do
    Process.sleep(100)
    Enum.map(pieces, &("o" <> &1))
  end
  defp package(screw) do
    Process.sleep(70)
    Enum.map(screw, &("|" <> &1 <> "|"))
  end

  defp output(screw) do
    IO.inspect(screw)
  end
end
