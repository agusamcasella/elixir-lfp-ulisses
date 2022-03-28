defmodule DungeonCrawl.InventoryItems do
  defstruct name: nil,
            quantity: 0

            defimpl String.Chars do
              def to_string(item), do: "#{item.name}:#{item.quantity}"
            end
end
