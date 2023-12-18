defmodule Needforvelocity.Repo.Migrations.AddRacerName do
  use Ecto.Migration

  def change do

    alter table(:racer) do
      add :name, :string
    end

  end
end
