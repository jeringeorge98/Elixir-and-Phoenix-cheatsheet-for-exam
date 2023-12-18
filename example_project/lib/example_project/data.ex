defmodule ExampleProject.Data do
  @moduledoc """
  The Data context.
  """

  import Ecto.Query, warn: false
  alias ExampleProject.Repo

  alias ExampleProject.Data.MyTodo

  @doc """
  Returns the list of my_todos.

  ## Examples

      iex> list_my_todos()
      [%MyTodo{}, ...]

  """
  def list_my_todos do
    Repo.all(MyTodo)
  end

  @doc """
  Gets a single my_todo.

  Raises `Ecto.NoResultsError` if the My todo does not exist.

  ## Examples

      iex> get_my_todo!(123)
      %MyTodo{}

      iex> get_my_todo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_my_todo!(id), do: Repo.get!(MyTodo, id)

  @doc """
  Creates a my_todo.

  ## Examples

      iex> create_my_todo(%{field: value})
      {:ok, %MyTodo{}}

      iex> create_my_todo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_my_todo(attrs \\ %{}) do
    %MyTodo{}
    |> MyTodo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a my_todo.

  ## Examples

      iex> update_my_todo(my_todo, %{field: new_value})
      {:ok, %MyTodo{}}

      iex> update_my_todo(my_todo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_my_todo(%MyTodo{} = my_todo, attrs) do
    my_todo
    |> MyTodo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a my_todo.

  ## Examples

      iex> delete_my_todo(my_todo)
      {:ok, %MyTodo{}}

      iex> delete_my_todo(my_todo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_my_todo(%MyTodo{} = my_todo) do
    Repo.delete(my_todo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking my_todo changes.

  ## Examples

      iex> change_my_todo(my_todo)
      %Ecto.Changeset{data: %MyTodo{}}

  """
  def change_my_todo(%MyTodo{} = my_todo, attrs \\ %{}) do
    MyTodo.changeset(my_todo, attrs)
  end
end
