defmodule RoadFighter.Repo.Migrations.CreateFighters do
  use Ecto.Migration

  def change do
    create table(:fighters) do
      add :name, :string, primary_key: true
      add :attack, :integer
      add :defense, :integer
      add :hp, :integer

      timestamps()
    end
  end
end
