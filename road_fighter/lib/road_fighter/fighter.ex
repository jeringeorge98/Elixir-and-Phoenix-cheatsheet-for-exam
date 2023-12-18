defmodule RoadFighter.Fighter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "fighters" do
    field :name, :string
    field :attack, :integer
    field :defense, :integer
    field :hp, :integer

    timestamps()
  end

  @doc false
  def changeset(fighter, attrs) do
    fighter
    |> cast(attrs, [:name, :attack, :defense, :hp])
    |> validate_required([:name, :attack, :defense, :hp])
    |> validate_number(:attack, greater_than_or_equal_to: 0)
    |> validate_number(:defense, greater_than_or_equal_to: 0)
    |> validate_number(:hp, greater_than: 0)
    |> unique_constraint(:name)
  end
end
