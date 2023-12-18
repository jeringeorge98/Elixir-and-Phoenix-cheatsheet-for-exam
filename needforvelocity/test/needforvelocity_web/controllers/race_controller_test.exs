defmodule NeedforvelocityWeb.RaceControllerTest do
  use NeedforvelocityWeb.ConnCase

  import Needforvelocity.AccountsFixtures

  @create_attrs %{distance: 120.5, min_risk: 120.5, min_points: 42, max_points: 42}
  @update_attrs %{distance: 456.7, min_risk: 456.7, min_points: 43, max_points: 43}
  @invalid_attrs %{distance: nil, min_risk: nil, min_points: nil, max_points: nil}

  describe "index" do
    test "lists all race", %{conn: conn} do
      conn = get(conn, ~p"/race")
      assert html_response(conn, 200) =~ "Listing Race"
    end
  end

  describe "new race" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/race/new")
      assert html_response(conn, 200) =~ "New Race"
    end
  end

  describe "create race" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/race", race: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/race/#{id}"

      conn = get(conn, ~p"/race/#{id}")
      assert html_response(conn, 200) =~ "Race #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/race", race: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Race"
    end
  end

  describe "edit race" do
    setup [:create_race]

    test "renders form for editing chosen race", %{conn: conn, race: race} do
      conn = get(conn, ~p"/race/#{race}/edit")
      assert html_response(conn, 200) =~ "Edit Race"
    end
  end

  describe "update race" do
    setup [:create_race]

    test "redirects when data is valid", %{conn: conn, race: race} do
      conn = put(conn, ~p"/race/#{race}", race: @update_attrs)
      assert redirected_to(conn) == ~p"/race/#{race}"

      conn = get(conn, ~p"/race/#{race}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, race: race} do
      conn = put(conn, ~p"/race/#{race}", race: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Race"
    end
  end

  describe "delete race" do
    setup [:create_race]

    test "deletes chosen race", %{conn: conn, race: race} do
      conn = delete(conn, ~p"/race/#{race}")
      assert redirected_to(conn) == ~p"/race"

      assert_error_sent 404, fn ->
        get(conn, ~p"/race/#{race}")
      end
    end
  end

  defp create_race(_) do
    race = race_fixture()
    %{race: race}
  end
end
