defmodule ExampleProject.DataFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ExampleProject.Data` context.
  """

  @doc """
  Generate a my_todo.
  """
  def my_todo_fixture(attrs \\ %{}) do
    {:ok, my_todo} =
      attrs
      |> Enum.into(%{
        description: "some description",
        done: true,
        title: "some title"
      })
      |> ExampleProject.Data.create_my_todo()

    my_todo
  end
end
