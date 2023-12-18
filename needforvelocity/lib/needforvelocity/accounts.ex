defmodule Needforvelocity.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Needforvelocity.Repo

  alias Needforvelocity.Accounts.Racer

  @doc """
  Returns the list of racer.

  ## Examples

      iex> list_racer()
      [%Racer{}, ...]

  """
  def list_racer do
    Repo.all(Racer)
  end

  @doc """
  Gets a single racer.

  Raises `Ecto.NoResultsError` if the Racer does not exist.

  ## Examples

      iex> get_racer!(123)
      %Racer{}

      iex> get_racer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_racer!(id), do: Repo.get!(Racer, id)

  @doc """
  Creates a racer.

  ## Examples

      iex> create_racer(%{field: value})
      {:ok, %Racer{}}

      iex> create_racer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_racer(attrs \\ %{}) do
    %Racer{}
    |> Racer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a racer.

  ## Examples

      iex> update_racer(racer, %{field: new_value})
      {:ok, %Racer{}}

      iex> update_racer(racer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_racer(%Racer{} = racer, attrs) do
    racer
    |> Racer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a racer.

  ## Examples

      iex> delete_racer(racer)
      {:ok, %Racer{}}

      iex> delete_racer(racer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_racer(%Racer{} = racer) do
    Repo.delete(racer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking racer changes.

  ## Examples

      iex> change_racer(racer)
      %Ecto.Changeset{data: %Racer{}}

  """
  def change_racer(%Racer{} = racer, attrs \\ %{}) do
    Racer.changeset(racer, attrs)
  end
end
