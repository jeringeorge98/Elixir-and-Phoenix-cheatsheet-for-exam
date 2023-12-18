defmodule NeedforvelocityWeb.RacerControllerTest do
  use NeedforvelocityWeb.ConnCase

  import Needforvelocity.AccountsFixtures

  @create_attrs %{speed: 42, racer_id: "some racer_id", boost: 42, risk: 120.5, points: 42}
  @update_attrs %{speed: 43, racer_id: "some updated racer_id", boost: 43, risk: 456.7, points: 43}
  @invalid_attrs %{speed: nil, racer_id: nil, boost: nil, risk: nil, points: nil}

  describe "index" do
    test "lists all racer", %{conn: conn} do
      conn = get(conn, ~p"/racer")
      assert html_response(conn, 200) =~ "Listing Racer"
    end
  end

  describe "new racer" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/racer/new")
      assert html_response(conn, 200) =~ "New Racer"
    end
  end

  describe "create racer" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/racer", racer: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/racer/#{id}"

      conn = get(conn, ~p"/racer/#{id}")
      assert html_response(conn, 200) =~ "Racer #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/racer", racer: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Racer"
    end
  end

  describe "edit racer" do
    setup [:create_racer]

    test "renders form for editing chosen racer", %{conn: conn, racer: racer} do
      conn = get(conn, ~p"/racer/#{racer}/edit")
      assert html_response(conn, 200) =~ "Edit Racer"
    end
  end

  describe "update racer" do
    setup [:create_racer]

    test "redirects when data is valid", %{conn: conn, racer: racer} do
      conn = put(conn, ~p"/racer/#{racer}", racer: @update_attrs)
      assert redirected_to(conn) == ~p"/racer/#{racer}"

      conn = get(conn, ~p"/racer/#{racer}")
      assert html_response(conn, 200) =~ "some updated racer_id"
    end

    test "renders errors when data is invalid", %{conn: conn, racer: racer} do
      conn = put(conn, ~p"/racer/#{racer}", racer: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Racer"
    end
  end

  describe "delete racer" do
    setup [:create_racer]

    test "deletes chosen racer", %{conn: conn, racer: racer} do
      conn = delete(conn, ~p"/racer/#{racer}")
      assert redirected_to(conn) == ~p"/racer"

      assert_error_sent 404, fn ->
        get(conn, ~p"/racer/#{racer}")
      end
    end
  end

  defp create_racer(_) do
    racer = racer_fixture()
    %{racer: racer}
  end
end
