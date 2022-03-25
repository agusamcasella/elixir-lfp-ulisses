defmodule DungeonCrawl.CLI.RoomActionsChoice do
  alias Mix.Shell.IO, as: Shell

  import DungeonCrawl.CLI.BaseCommands

  def start(room) do
    room_actions = room.actions

    Shell.info(room.description)

    action =
      room_actions
      |> display_options
      |> generate_question_options("Wich")
      |> Shell.prompt()
      |> parse_answer_to_integer
      |> find_action_by_index(room_actions)

    {room, action}
  end


  def find_action_by_index(n,room_actions) do
    Enum.at(room_actions,n)
  end
end
