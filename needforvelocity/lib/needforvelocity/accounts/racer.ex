defmodule Needforvelocity.Accounts.Racer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "racer" do
    field :speed, :integer
    field :name, :string
    field :racer_id, :string
    field :boost, :integer
    field :risk, :float
    field :points, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(racer, attrs) do
    racer
    |> cast(attrs, [:racer_id, :speed, :boost, :risk, :points, :name])
    |> validate_required([:racer_id, :speed, :boost, :risk, :points, :name])
    |> validate_number(:speed, greater_than: 0, less_than: 200)
    |> validate_number(:boost, greater_than_or_equal_to: 0, less_than: 200)
    |> validate_number(:risk, greater_than_or_equal_to: 0.0, less_than_or_equal_to: 1.0)
    |> validate_racer_id()
    |> unique_constraint(:racer_id)
  end
  def validate_racer_id(changeset) do
    case get_field(changeset, :racer_id) do
      nil ->
        add_error(changeset, :racer_id, "can't be blank")
      racer_id ->
        if Regex.match?(~r/^[A-Z][0-9]{4}$/, racer_id) do
          changeset
        else
          add_error(changeset, :racer_id, "is invalid")
        end
    end
  end
end
