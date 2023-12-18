defmodule ExampleProjectWeb.MyTodoControllerTest do
  use ExampleProjectWeb.ConnCase

  import ExampleProject.DataFixtures

  @create_attrs %{done: true, description: "some description", title: "some title"}
  @update_attrs %{done: false, description: "some updated description", title: "some updated title"}
  @invalid_attrs %{done: nil, description: nil, title: nil}

  describe "index" do
    test "lists all my_todos", %{conn: conn} do
      conn = get(conn, ~p"/my_todos")
      assert html_response(conn, 200) =~ "Listing My todos"
    end
  end

  describe "new my_todo" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/my_todos/new")
      assert html_response(conn, 200) =~ "New My todo"
    end
  end

  describe "create my_todo" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/my_todos", my_todo: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/my_todos/#{id}"

      conn = get(conn, ~p"/my_todos/#{id}")
      assert html_response(conn, 200) =~ "My todo #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/my_todos", my_todo: @invalid_attrs)
      assert html_response(conn, 200) =~ "New My todo"
    end
  end

  describe "edit my_todo" do
    setup [:create_my_todo]

    test "renders form for editing chosen my_todo", %{conn: conn, my_todo: my_todo} do
      conn = get(conn, ~p"/my_todos/#{my_todo}/edit")
      assert html_response(conn, 200) =~ "Edit My todo"
    end
  end

  describe "update my_todo" do
    setup [:create_my_todo]

    test "redirects when data is valid", %{conn: conn, my_todo: my_todo} do
      conn = put(conn, ~p"/my_todos/#{my_todo}", my_todo: @update_attrs)
      assert redirected_to(conn) == ~p"/my_todos/#{my_todo}"

      conn = get(conn, ~p"/my_todos/#{my_todo}")
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, my_todo: my_todo} do
      conn = put(conn, ~p"/my_todos/#{my_todo}", my_todo: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit My todo"
    end
  end

  describe "delete my_todo" do
    setup [:create_my_todo]

    test "deletes chosen my_todo", %{conn: conn, my_todo: my_todo} do
      conn = delete(conn, ~p"/my_todos/#{my_todo}")
      assert redirected_to(conn) == ~p"/my_todos"

      assert_error_sent 404, fn ->
        get(conn, ~p"/my_todos/#{my_todo}")
      end
    end
  end

  defp create_my_todo(_) do
    my_todo = my_todo_fixture()
    %{my_todo: my_todo}
  end
end
