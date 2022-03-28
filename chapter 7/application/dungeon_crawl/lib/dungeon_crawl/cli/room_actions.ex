# defmodule DungeonCrawl.CLI.RoomActionsChoice do
#   alias Mix.Shell.IO, as: Shell
#   import DungeonCrawl.CLI.BaseCommands

#   def start(room) do
#     room_actions = room.actions
#     find_action_by_index = &Enum.at(room_actions, &1)
#     Shell.info(room.description)

#     chosen_action =
#       room_actions
#       |> display_options
#       |> generate_question
#       |> Shell.prompt()
#       |> parse_answer
#       |> find_action_by_index.()

#     {room, chosen_action}
#   end
# end

# code refractor... para aprovechar funciones nuevas de base commands
defmodule DungeonCrawl.CLI.RoomActionsChoice do
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.CLI.BaseCommands

  def start(room) do
    Shell.info(room.description())
    chosen_action = ask_for_option(room.actions)
    {room, chosen_action}
  end
end
