defmodule NeedforvelocityWeb.RacerController do
  use NeedforvelocityWeb, :controller

  alias Needforvelocity.Accounts
  alias Needforvelocity.Accounts.Racer

  def index(conn, _params) do
    racer = Accounts.list_racer()
    render(conn, :index, racer_collection: racer)
  end

  def new(conn, _params) do
    changeset = Accounts.change_racer(%Racer{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"racer" => racer_params}) do
    case Accounts.create_racer(racer_params) do
      {:ok, racer} ->
        conn
        |> put_flash(:info, "Racer created successfully.")
        |> redirect(to: ~p"/racer/#{racer}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    racer = Accounts.get_racer!(id)
    render(conn, :show, racer: racer)
  end

  def edit(conn, %{"id" => id}) do
    racer = Accounts.get_racer!(id)
    changeset = Accounts.change_racer(racer)
    render(conn, :edit, racer: racer, changeset: changeset)
  end

  def update(conn, %{"id" => id, "racer" => racer_params}) do
    racer = Accounts.get_racer!(id)

    case Accounts.update_racer(racer, racer_params) do
      {:ok, racer} ->
        conn
        |> put_flash(:info, "Racer updated successfully.")
        |> redirect(to: ~p"/racer/#{racer}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, racer: racer, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    racer = Accounts.get_racer!(id)
    {:ok, _racer} = Accounts.delete_racer(racer)

    conn
    |> put_flash(:info, "Racer deleted successfully.")
    |> redirect(to: ~p"/racer")
  end
end
