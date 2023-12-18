defmodule WhiteBreadContext do
  alias ExampleProject.Repo
  alias ExampleProject.Data.MyTodo
  use WhiteBread.Context
  use Hound.Helpers
  use ExampleProject.TestHelpers

  def delete_everything() do
    Repo.delete_all(MyTodo)
  end

  feature_starting_state(fn ->
    Application.ensure_all_started(:hound)
    %{}
  end)

  scenario_starting_state(fn _state ->
    Hound.start_session()

    # Match Window Size with CI
    set_window_size(current_window_handle(), 1280, 1024)

    # We delete everything in the DB  at the start of each scenario,
    # because the last scencario may have crashed or has been
    # killed by the user
    delete_everything()

    %{}
  end)

  scenario_finalize(fn _status, _state ->
    Hound.Helpers.Cookie.delete_cookies()

    # We delete everything in the DB at the end of each scenario
    delete_everything()

    try do
      logs = fetch_log()

      if String.length(logs) > 0 do
        IO.puts("\tBrowser Logs: " <> inspect(logs))
      end
    rescue
      _ -> IO.puts("\tError getting Browser Logs")
    end

    # Ecto.Adapters.SQL.Sandbox.checkin(ExampleProject.Repo)
    # Comment out if you don't want chrome to directly close after the test
    # Hound.end_session()

    nil
  end)

  # The skeleton of the steps would be here
  when_(~r/^I open "(?<path>[^"]+)"$/, fn state, %{path: path} ->
    navigate_to(path)
    {:ok, state}
  end)

  then_(
    ~r/^I should read the text "(?<argument_one>[^"]+)"$/,
    fn state, %{argument_one: text} ->
      assert visible_in_page?(~r/#{text}/)
      {:ok, state}
    end
  )

  and_(
    ~r/^I click on button "(?<button_text>[^"]+)"$/,
    fn state, %{button_text: button_text} ->
      click(find_some_element_with_text(button_text))

      {:ok, state}
    end
  )

  and_(~r/^I scroll down$/, fn state ->
    execute_script_async("window.scrollTo(0, 10000000); arguments[arguments.length-1]()", [])
    {:ok, state}
  end)

  and_(
    ~r/^I click on element which id starts with "(?<button_text>[^"]+)"$/,
    fn state, %{button_text: button_text} ->
      execute_script_async(
        "document.querySelector('a[id^=\"#{button_text}\"],button[id^=\"#{button_text}\"]').click();arguments[arguments.length-1]()",
        []
      )

      :timer.sleep(500)

      {:ok, state}
    end
  )

  and_(
    ~r/^I click on Table Header "(?<label>[^"]+)"$/,
    fn state, %{label: label} ->
      find_all_elements(:tag, "th")
      |> Enum.find(&String.contains?(inner_text(&1), label))
      |> click()

      {:ok, state}
    end
  )

  and_(
    ~r/^I click on link "(?<link_text>[^"]+)"$/,
    fn state, %{link_text: link_text} ->
      click(find_link_with_text(link_text))

      {:ok, state}
    end
  )


  # and_(
  #   ~r/^I\'m logged in as user "(?<username>[^"]+)" with password "(?<password>[^"]+)"$/,
  #   fn state, %{username: username, password: password} ->
  #     navigate_to("/sessions")
  #     fill_field({:id, "username"}, username)
  #     fill_field({:id, "password"}, password)
  #     click(find_button_with_text("Log in"))

  #     {:ok, state}
  #   end
  # )

  then_(
    ~r/^the field "(?<field>[^"]+)" should have value "(?<value>[^"]+)"$/,
    fn state, %{field: field, value: value} ->
      find_element(:css, "input[id=\"#{field}\"],input[name=\"#{field}\"]")
      |> attribute_value("value")
      |> String.contains?(value)
      |> assert()

      {:ok, state}
    end
  )

  when_(
    ~r/^I check "(?<field_name>[^"]+)"$/,
    fn state, %{field_name: field_name} ->
      check(field_name)
      {:ok, state}
    end
  )

  and_(~r/^the following todos:$/, fn state, %{table_data: table} ->
    table
    |> Enum.map(fn row ->
      todo = %{
        title: row.title,
        description: row.description,
        done: row.done
      }

      MyTodo.changeset(%MyTodo{}, todo)
    end)
    |> Enum.each(fn changeset -> Repo.insert!(changeset) end)

    {:ok, state}
  end)


  # and_(~r/^the following events:$/, fn state, %{table_data: table} ->
  #   table
  #   |> Enum.map(fn row ->
  #     owner = Models.get_user_by_username(row.owner)

  #     event = %{
  #       name: row.name,
  #       description: row.description,
  #       location: %Geo.Point{
  #         coordinates: {row.longitude |> String.to_float(), row.latitude |> String.to_float()},
  #         srid: 4326
  #       },
  #       owner_id: owner.id,
  #       datetime: row.datetime,
  #       ticket_price: row.ticket_price |> String.to_float(),
  #       visibility: row.visibility,
  #       topics: Jason.decode!(row.topics),
  #       allowed_users:
  #         if Map.has_key?(row, :allowed_users) do
  #           Jason.decode!(row.allowed_users)
  #         else
  #           []
  #         end
  #     }

  #     Event.changeset(%Event{}, event)
  #   end)
  #   |> Enum.each(fn changeset -> Repo.insert!(changeset) end)

  #   {:ok, state}
  # end)






  then_(
    ~r/^I should get the error message "(?<error_msg>[^"]+)"$/,
    fn state, %{error_msg: error_msg} ->
      assert visible_in_page?(~r/#{error_msg}/)
      {:ok, state}
    end
  )

  when_(
    ~r/^I fill in "(?<field>[^"]+)" with "(?<value>[^"]+)"$/,
    fn state, %{field: field, value: value} ->
      fill_field(
        {:css, "input[id='#{field}'],input[name='#{field}'],textarea[name='#{field}']"},
        value
      )

      # execute_script_async(
      #   "document.querySelector('input[id=\"#{field}\"],input[name=\"#{field}\"]').dispatchEvent(new Event('change'))"
      # )

      {:ok, state}
    end
  )

  and_(
    ~r/^I wait for "(?<seconds>[^"]+)" second$/,
    fn state, %{seconds: seconds} ->
      :timer.sleep(String.to_integer(seconds) * 1000)

      {:ok, state}
    end
  )

  then_(
    ~r/^I should not read the text "(?<text>[^"]+)"$/,
    fn state, %{text: text} ->
      refute visible_in_page?(~r/#{text}/)

      {:ok, state}
    end
  )


  and_(
    ~r/^I select "(?<value>[^"]+)" in "(?<field>[^"]+)"$/,
    fn state, %{field: field, value: value} ->
      select(value, from: field)

      {:ok, state}
    end
  )


  and_(~r/^I close flash$/, fn state ->
    find_element(:css, ".delete.close-flash") |> click()

    {:ok, state}
  end)

  then_(
    ~r/^I should read the text in order \[(?<texts>[^\]]+)\]$/,
    fn state, %{texts: texts} ->
      texts_parsed = Jason.decode!("[#{texts}]")

      body = inner_text({:tag, "body"})

      # Ensure that the texts in text_parsed appear in the same order in the page
      ensure_substring_order(body, texts_parsed) |> assert()
      {:ok, state}
    end
  )
end
