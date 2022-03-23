defmodule TicTacToe do
  def winner(board) do
    check(board)
  end

  defp check({
    w, w, w,
    _, _, _,
    _, _, _
    }), do: { :winner, w }
  defp check({ _, _, _, w, w, w, _, _, _ }), do: { :winner, w }
  defp check({ _, _, _, _, _, _, w, w, w }), do: { :winner, w }
  defp check({ w, _, _, w, _, _, w, _, _ }), do: { :winner, w }
  defp check({ _, w, _, _, w, _, _, w, _ }), do: { :winner, w }
  defp check({ _, _, w, _, _, w, _, _, w }), do: { :winner, w }
  defp check({ w, _, _, _, w, _, _, _, w }), do: { :winner, w }
  defp check({ _, _, w, _, w, _, w, _, _ }), do: { :winner, w }
  defp check(_), do: { :no_winner }
end


#funcion recive el tablero
