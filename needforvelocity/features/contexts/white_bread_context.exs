defmodule WhiteBreadContext do
  use WhiteBread.Context
  use Hound.Helpers

  feature_starting_state(fn ->
    Application.ensure_all_started(:hound)
    %{}
  end)

  scenario_starting_state(fn _state ->
    Hound.start_session()
    %{}
  end)

  scenario_finalize(fn _status, _state ->
    Hound.end_session()
  end)

  # The skeleton of the steps would be here

  given_(~r/^Some racers in the database$/, fn state ->
    {:ok, state}
  end)

  and_(~r/^I have the following race information$/, fn state ->
    {:ok, state}
  end)

  when_(~r/^I click on organize race$/, fn state ->
    {:ok, state}
  end)

  then_(
    ~r/^I should see the message "(?<argument_one>[^"]+)"$/,
    fn state, %{argument_one: _argument_one} ->
      {:ok, state}
    end
  )
end
