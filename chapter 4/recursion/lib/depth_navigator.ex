defmodule DepthNav do
  @max_depth 2
  def navigate(dir) do
    expanded_dir = Path.expand(dir)
    go_through([expanded_dir], 0)
  end

  # base-stop condition
  defp print_and_navigate(_dir, false, _current_depth), do: nil

  defp print_and_navigate(dir, true, current_depth) do
    IO.puts(dir)
    children_dirs = File.ls!(dir)
    go_through(expand_dirs(children_dirs, dir), current_depth + 1)
  end

  defp go_through([], _current_depth), do: nil
  # stop condition
  defp go_through(_dirs, current_depth) when current_depth > @max_depth, do: nil

  defp go_through([content | rest], current_depth) do
    print_and_navigate(content, File.dir?(content), current_depth)
    go_through(rest, current_depth)
  end
end
