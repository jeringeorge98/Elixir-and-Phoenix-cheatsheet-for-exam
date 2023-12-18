defmodule WhiteBreadContext do
  use WhiteBread.Context
  #use Hound.Helpers

  alias RoadFighter.{Fighter, Repo}
  feature_starting_state fn  ->
    Application.ensure_all_started(:hound)
    %{}
  end

  scenario_starting_state fn _state ->
    #Hound.start_session
    Ecto.Adapters.SQL.Sandbox.checkout(RoadFighter.Repo)
    Ecto.Adapters.SQL.Sandbox.mode(RoadFighter.Repo, {:shared, self()})
    %{}
  end

  scenario_finalize fn _status, _state ->
    Ecto.Adapters.SQL.Sandbox.checkin(RoadFighter.Repo)
    #Hound.end_session  # Comment this to keep browser session open
    # Nill
  end



  given_ ~r/the game is ready for a new fight/, fn state ->
    # Initialize the game state here
    # This might involve resetting the state or preparing the database
    {:ok, state}
  end


  given_ ~r/there are two fighters in the database/, fn state ->
    # Ensure that DIO and Jotaro exist in the database with the specified attributes
    # This might involve inserting or ensuring the existence of these records
    检查数据库中是否存在两个战士

    {:ok, state}
  end

  and_ ~r/the fighters "(?<fighter1>[^"]+)" and "(?<fighter2>[^"]+)" are chosen to fight/, fn state, %{fighter1: fighter1, fighter2: fighter2} ->
    # Logic to select fighters for the fight
    # Update state with chosen fighters
    # {:ok, state |> Map.put(state, :fighters, [fighter1, fighter2])}
    {:ok, state}
  end

  when_ ~r/I trigger the fight/, fn state ->
    # Logic to simulate the fight
    # This would involve fetching the fighters from the state, simulating the fight logic,
    # and updating their HP accordingly in the database
    {:ok, state}
  end

  then_ ~r/both fighters should survive the fight/, fn state ->
    # Check that both fighters' HP is above 0
    # Assert on the database records or the updated state
    {:ok, state}
  end

  then_ ~r/the HP of "(?<fighter>[^"]+)" should be reduced by (?<damage>[^"]+) points/, fn state, %{fighter: fighter, damage: damage} ->
    # Logic to verify that the specified fighter's HP is reduced by the specified amount
    {:ok, state}
  end

  and_ ~r/^the result of the fight should be a "(?<fight_result>[^"]+)"$/, fn state, %{fight_result: fight_result} ->
    # Logic to verify the result of the fight
    {:ok, state}
  end

  and_ ~r/^no fighter should be removed from the database$/, fn state ->
    {:ok, state}
  end
end
