defmodule Needforvelocity.Repo.Migrations.CreateRace do
  use Ecto.Migration

  def change do
    create table(:race) do
      add :distance, :float
      add :min_risk, :float
      add :min_points, :integer
      add :max_points, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
