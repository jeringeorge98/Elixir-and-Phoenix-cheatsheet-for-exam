defmodule ExampleProject.DataTest do
  use ExampleProject.DataCase

  alias ExampleProject.Data

  describe "my_todos" do
    alias ExampleProject.Data.MyTodo

    import ExampleProject.DataFixtures

    @invalid_attrs %{done: nil, description: nil, title: nil}

    test "list_my_todos/0 returns all my_todos" do
      my_todo = my_todo_fixture()
      assert Data.list_my_todos() == [my_todo]
    end

    test "get_my_todo!/1 returns the my_todo with given id" do
      my_todo = my_todo_fixture()
      assert Data.get_my_todo!(my_todo.id) == my_todo
    end

    test "create_my_todo/1 with valid data creates a my_todo" do
      valid_attrs = %{done: true, description: "some description", title: "some title"}

      assert {:ok, %MyTodo{} = my_todo} = Data.create_my_todo(valid_attrs)
      assert my_todo.done == true
      assert my_todo.description == "some description"
      assert my_todo.title == "some title"
    end

    test "create_my_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_my_todo(@invalid_attrs)
    end

    test "update_my_todo/2 with valid data updates the my_todo" do
      my_todo = my_todo_fixture()
      update_attrs = %{done: false, description: "some updated description", title: "some updated title"}

      assert {:ok, %MyTodo{} = my_todo} = Data.update_my_todo(my_todo, update_attrs)
      assert my_todo.done == false
      assert my_todo.description == "some updated description"
      assert my_todo.title == "some updated title"
    end

    test "update_my_todo/2 with invalid data returns error changeset" do
      my_todo = my_todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_my_todo(my_todo, @invalid_attrs)
      assert my_todo == Data.get_my_todo!(my_todo.id)
    end

    test "delete_my_todo/1 deletes the my_todo" do
      my_todo = my_todo_fixture()
      assert {:ok, %MyTodo{}} = Data.delete_my_todo(my_todo)
      assert_raise Ecto.NoResultsError, fn -> Data.get_my_todo!(my_todo.id) end
    end

    test "change_my_todo/1 returns a my_todo changeset" do
      my_todo = my_todo_fixture()
      assert %Ecto.Changeset{} = Data.change_my_todo(my_todo)
    end
  end
end
