defmodule RoadFighterWeb.FighterController do
  use RoadFighterWeb, :controller
  alias RoadFighter.{Fighter, Repo}

  # Render the form for creating a new fighter
  def new(conn, _params) do
    render(conn, "new.html")
  end

  # Handle the creation of a new fighter
  def create(conn, %{"fighter" => fighter_params}) do
    changeset = Fighter.changeset(%Fighter{}, fighter_params)

    case Repo.insert(changeset) do
      {:ok, _fighter} ->
        conn
        |> put_flash(:info, "Fighter created successfully.")
        |> redirect(to: Routes.fighter_path(conn, :new))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
