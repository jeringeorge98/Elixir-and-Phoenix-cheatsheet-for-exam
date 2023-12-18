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

  alias Needforvelocity.Accounts.Race

  @doc """
  Returns the list of race.

  ## Examples

      iex> list_race()
      [%Race{}, ...]

  """
  def list_race do
    Repo.all(Race)
  end

  @doc """
  Gets a single race.

  Raises `Ecto.NoResultsError` if the Race does not exist.

  ## Examples

      iex> get_race!(123)
      %Race{}

      iex> get_race!(456)
      ** (Ecto.NoResultsError)

  """
  def get_race!(id), do: Repo.get!(Race, id)

  @doc """
  Creates a race.

  ## Examples

      iex> create_race(%{field: value})
      {:ok, %Race{}}

      iex> create_race(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_race(attrs \\ %{}) do
    %Race{}
    |> Race.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a race.

  ## Examples

      iex> update_race(race, %{field: new_value})
      {:ok, %Race{}}

      iex> update_race(race, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_race(%Race{} = race, attrs) do
    race
    |> Race.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a race.

  ## Examples

      iex> delete_race(race)
      {:ok, %Race{}}

      iex> delete_race(race)
      {:error, %Ecto.Changeset{}}

  """
  def delete_race(%Race{} = race) do
    Repo.delete(race)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking race changes.

  ## Examples

      iex> change_race(race)
      %Ecto.Changeset{data: %Race{}}

  """
  def change_race(%Race{} = race, attrs \\ %{}) do
    Race.changeset(race, attrs)
  end
end
