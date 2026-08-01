# DungeonCrawl

A text-based dungeon crawler built in Elixir to learn functional programming, recursion, pattern matching, and behaviours.

You awake in a dungeon full of monsters. Survive room after room until you find the exit — or fall to your wounds.

## How to run

Requires [Elixir](https://elixir-lang.org/install.html) (tested with Elixir ~> 1.19) and Mix.

```bash
mix deps.get
mix start
```

## How to play

1. **Choose your hero.** Pick from the Knight (strong defense, consistent damage), the Wizard (high burst damage, low health), or the Rogue (unpredictable damage).
2. **Crawl the dungeon.** Rooms are drawn at random. Move forward and you may find the exit... or an enemy blocking your path.
3. **Fight.** Combat is turn-based: your hero and the enemy trade attacks using their `damage_range`, and the fight is resolved recursively until someone hits 0 HP.
4. **Win or lose.** Find the exit and you win. Fall to 0 HP and it's game over.

## Project structure

```
lib/dungeon_crawl/
├── battle.ex                  # Recursive turn-based combat
├── character.ex               # Character struct + damage/heal helpers
├── heroes.ex                  # Playable hero definitions
├── enemies.ex                 # Enemy definitions
├── room.ex                    # Room definitions and random selection
├── room/
│   ├── action.ex              # Room actions (forward/rest/search)
│   ├── trigger.ex             # Trigger behaviour (@callback)
│   └── triggers/
│       ├── enemy.ex           # Enemy encounter trigger
│       └── exit.ex            # Exit trigger
└── cli/
    ├── main.ex                # Game loop
    ├── base_commands.ex       # Shared menu helpers
    ├── hero_choice.ex         # Hero selection flow
    └── room_actions_choice.ex # Room action selection flow
lib/mix/tasks/start.ex         # `mix start` task entrypoint
```

## Concepts covered

- **Pattern matching** throughout, e.g. guarding the game over state in `CLI.Main.crawl/2` and the combat base case in `Battle.fight/2`
- **Recursion** — `Battle.fight/2` recursively trades attacks until a combatant is defeated
- **Behaviours** — `Room.Trigger` defines a `run/2` callback implemented by the `Enemy` and `Exit` triggers
- **Structs and pipes** — `Character`, `Room`, and `Action` structs with data-driven config
- **Mix tasks and `Mix.Shell`** — interactive CLI prompts via `Mix.Shell.IO`

## Tests

```bash
mix test
```
