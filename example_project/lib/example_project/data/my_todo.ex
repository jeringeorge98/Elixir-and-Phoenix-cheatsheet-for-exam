defmodule ExampleProject.Data.MyTodo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "my_todos" do
    field :done, :boolean, default: false
    field :description, :string
    field :title, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(my_todo, attrs) do
    my_todo
    |> cast(attrs, [:title, :description, :done])
    |> validate_required([:title, :description, :done])
  end
end
