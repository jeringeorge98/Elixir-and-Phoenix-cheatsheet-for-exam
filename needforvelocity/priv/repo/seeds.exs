# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Needforvelocity.Repo.insert!(%Needforvelocity.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias Needforvelocity.Repo
alias Needforvelocity.Accounts
alias Needforvelocity.Accounts.Race

alias Needforvelocity.Accounts.Racer


# Insert racers
racer1 =
  Racer.changeset(%Racer{}, %{
    name: "Alice",
    racer_id: "A1234",
    speed: 100,
    boost: 50,
    risk: 0.5,
    points: 230,
  })
  |> Repo.insert!()

  racer2 =
    Racer.changeset(%Racer{}, %{
      name: "James",
      racer_id: "A2234",
      speed: 150,
      boost: 30,
      risk: 0.8,
      points: 250,
    })
    |> Repo.insert!()

# Insert User 3
racer3 =
  Racer.changeset(%Racer{}, %{
    name: "Charlie",
    racer_id: "A3234",
    speed: 70,
    boost: 70,
    risk: 0.2,
    points: 220,
  })
  |> Repo.insert!()

# Insert User 4
racer4 =
  Racer.changeset(%Racer{}, %{
    name: "Cheetos",
    racer_id: "A4234",
    speed: 20,
    boost: 30,
    risk: 0.6,
    points: 220,
  })
  |> Repo.insert!()
