defmodule Needforvelocity.Accounts.Race do
  use Ecto.Schema
  import Ecto.Changeset

  schema "race" do
    field :distance, :float
    field :min_risk, :float
    field :min_points, :integer
    field :max_points, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(race, attrs) do
    race
    |> cast(attrs, [:distance, :min_risk, :min_points, :max_points])
    |> validate_required([:distance, :min_risk, :min_points, :max_points])
    |> validate_number(:distance, greater_than: 250.0)
    |> validate_number(:min_risk, greater_than: 0.0, less_than_or_equal_to: 1.0)
    |> validate_min()
  end
  defp validate_min(changeset) do
    min_points = get_field(changeset, :min_points)
    max_points = get_field(changeset, :max_points)
    if min_points >= max_points do
      add_error(changeset, :min_points, "Min points must be less than max points")
    else
      changeset
    end
  end
end
