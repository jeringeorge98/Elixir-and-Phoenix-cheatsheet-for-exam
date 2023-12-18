defmodule NeedforvelocityWeb.RaceController do
  use NeedforvelocityWeb, :controller

  alias Needforvelocity.Accounts
  alias Needforvelocity.Accounts.Race

  def index(conn, _params) do
    race = Accounts.list_race()
    render(conn, :index, race_collection: race)
  end

  def new(conn, _params) do
    changeset = Accounts.change_race(%Race{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"race" => race_params}) do
    case Accounts.create_race(race_params) do
      {:ok, race} ->
        conn
        |> put_flash(:info, "Race created successfully.")
        |> redirect(to: ~p"/race/#{race}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    race = Accounts.get_race!(id)
    render(conn, :show, race: race)
  end

  def edit(conn, %{"id" => id}) do
    race = Accounts.get_race!(id)
    changeset = Accounts.change_race(race)
    render(conn, :edit, race: race, changeset: changeset)
  end

  def update(conn, %{"id" => id, "race" => race_params}) do
    race = Accounts.get_race!(id)

    case Accounts.update_race(race, race_params) do
      {:ok, race} ->
        conn
        |> put_flash(:info, "Race updated successfully.")
        |> redirect(to: ~p"/race/#{race}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, race: race, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    race = Accounts.get_race!(id)
    {:ok, _race} = Accounts.delete_race(race)

    conn
    |> put_flash(:info, "Race deleted successfully.")
    |> redirect(to: ~p"/race")
  end
end
