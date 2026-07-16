defmodule DungeonCrawl.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.CLI.BaseCommands

  def start do
    Shell.cmd("clear")
    Shell.info("Start by choosing your hero:")

    heroes = DungeonCrawl.Heroes.all()
    find_hero_by_index = &Enum.at(heroes, &1)

    hero_names = Enum.map(heroes, &(&1.name))

    hero_names
    |> display_options

    hero_names
    |> generate_question
    |> Shell.prompt
    |> parse_answer
    |> find_hero_by_index.()
    |> confirm_hero
  end

  defp confirm_hero(chosen) do
    Shell.cmd("clear")
    Shell.info(chosen.description)
    if Shell.yes?("Confirm?"), do: chosen, else: start()
  end

end
