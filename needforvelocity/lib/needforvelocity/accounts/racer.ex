defmodule Needforvelocity.Accounts.Racer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "racer" do
    field :speed, :integer
    field :racer_id, :string
    field :boost, :integer
    field :risk, :float
    field :points, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(racer, attrs) do
    racer
    |> cast(attrs, [:racer_id, :speed, :boost, :risk, :points])
    |> validate_required([:racer_id, :speed, :boost, :risk, :points])
  end
end
