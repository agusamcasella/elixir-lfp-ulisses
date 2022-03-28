defmodule DungeonCrawl.Room.Action do
  alias DungeonCrawl.Room.Action
  defstruct  label: nil , id: nil
  # @type t :: etc darle tipos a label y id para corroborar

  #def las 3 acciones

  def forward do
    %Action{id: :forward, label: "Move forward."}
  end

  def battle do
    %Action{id: :battle, label: "You fill yourself with courage and go to battle."}
  end

  def rest do
    %Action{id: :rest, label: "You feel comfy and rest a bit."}
  end

  def search do
    %Action{id: :search, label: "Search the room for some treasure."}
  end

  def use_item do
    %Action{id: :use_item, label: "Use a potion from inventory if any, and move forward."}
  end

  defimpl String.Chars do
    def to_string(action), do: action.label
  end
end
