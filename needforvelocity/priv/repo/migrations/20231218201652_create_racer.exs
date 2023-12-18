defmodule Needforvelocity.Repo.Migrations.CreateRacer do
  use Ecto.Migration

  def change do
    create table(:racer) do
      add :racer_id, :string
      add :speed, :integer
      add :boost, :integer
      add :risk, :float
      add :points, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
