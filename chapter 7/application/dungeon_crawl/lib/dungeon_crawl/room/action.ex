defmodule DungeonCrawl.Room.Action do
  alias DungeonCrawl.Room.Action
  defstruct label: nil, id: nil
  @type t :: %Action{id: atom, label: String.t()}
  def forward, do: %Action{id: :forward, label: "Move forward."}
  def rest, do: %Action{id: :rest, label: "Take a better look and rest."}
  def search, do: %Action{id: :search, label: "Search the room."}

  # para poder usar la room como un string directamente

  defimpl String.Chars do
    def to_string(action), do: action.label
  end
end