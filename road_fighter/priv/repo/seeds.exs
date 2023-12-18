# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RoadFighter.Repo.insert!(%RoadFighter.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias RoadFighter.{Fighter, Repo}

[%{name: "DIO", attack: 150, defense: 200, hp: 1000},
 %{name: "Jotaro", attack: 700, defense: 100, hp: 500}]
|> Enum.map(fn fighter_data -> Fighter.changeset(%Fighter{}, fighter_data) end)
|> Enum.each(fn changeset -> Repo.insert!(changeset) end)

IO.puts "Fighters seeded successfully!"
