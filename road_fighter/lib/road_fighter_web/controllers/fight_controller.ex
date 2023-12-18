defmodule RoadFighterWeb.FightController do
  use RoadFighterWeb, :controller
  alias RoadFighter.{Fighter, Repo}

  # Render the form for organizing a new fight
  def new(conn, _params) do
    render(conn, "new.html")
  end

  # Handle the fight logic
  def create(conn, %{ "fight" => %{ "fighter1" => fighter1_name, "fighter2" => fighter2_name } }) do
    with {:ok, fighter1} <- Repo.get_by(Fighter, name: fighter1_name),
         {:ok, fighter2} <- Repo.get_by(Fighter, name: fighter2_name),
         {:ok, result_msg} <- MyApp.FightLogic.organize_fight(fighter1, fighter2) do
      conn
      |> put_flash(:info, result_msg)
      |> redirect(to: ~p"/fights/index")
    else
      _error ->
        conn
        |> put_flash(:error, "Error organizing fight.")
        |> redirect(to: ~p"/")
    end
  end
end
